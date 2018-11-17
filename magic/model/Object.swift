import Foundation

class Object: Targetable, NSCopying {
    var id:Int
    var name:String?
    var colors:Set<Color> = []
    var manaCost:ManaCost?
    var supertypes:Set<Supertype> = []
    var types:Set<Type> = []
    var subtypes:Set<Subtype> = []
    private var basePower:Int?
    var power: Int? {
        get {
            return getPower()
        }
        set (newPower) {
            basePower = newPower
        }
    }
    private var baseToughness:Int?
    var toughness: Int? {
        get {
            return getToughness()
        }
        set (newToughness) {
            baseToughness = newToughness
        }
    }
    var effects:[Effect] = []
    var activeEffects:[ContinuousEffect] = []
    var counters:[Counter: Int] = [:]
    
    var attachedTo: Object?
    var auraRestriction: ((Object) -> Bool)?
    
    var activatedAbilities:[ActivatedAbility] = []
    var staticAbilities:[StaticAbility] = []
    var triggeredAbilities:[TriggeredAbility] = []
    var replacementEffects:[ReplacementEffect] = []
    
    private var baseDeathtouch: Bool = false
    var deathtouch: Bool {
        get { return applyContinuousEffects().baseDeathtouch }
        set (newDeathtouch) { baseDeathtouch = newDeathtouch }
    }
    private var baseDefender: Bool = false
    var defender: Bool {
        get { return applyContinuousEffects().baseDefender }
        set (newDefender) { baseDefender = newDefender }
    }
    private var baseEntersTapped: Bool = false
    var entersTapped: Bool {
        get { return applyContinuousEffects().baseEntersTapped }
        set (newEntersTapped) { baseEntersTapped = newEntersTapped }
    }
    private var baseFlash: Bool = false
    var flash: Bool {
        get { return applyContinuousEffects().baseFlash }
        set (newFlash) { baseFlash = newFlash }
    }
    private var baseFlying: Bool = false
    var flying: Bool {
        get { return applyContinuousEffects().baseFlying }
        set (newFlying) { baseFlying = newFlying }
    }
    func getBaseFlying() -> Bool { return baseFlying }
    private var baseHaste: Bool = false
    var haste: Bool {
        get { return applyContinuousEffects().baseHaste }
        set (newHaste) { baseHaste = newHaste }
    }
    private var baseIndestructible: Bool = false
    var indestructible: Bool {
        get { return applyContinuousEffects().baseIndestructible }
        set (newIndestructible) { baseIndestructible = newIndestructible }
    }
    private var baseLifelink: Bool = false
    var lifelink: Bool {
        get { return applyContinuousEffects().baseLifelink }
        set (newLifelink) { baseLifelink = newLifelink }
    }
    private var baseReach: Bool = false
    var reach: Bool {
        get { return applyContinuousEffects().baseReach }
        set (newReach) { baseReach = newReach }
    }
    private var baseTrample: Bool = false
    var trample: Bool {
        get { return applyContinuousEffects().baseTrample }
        set (newTrample) { baseTrample = newTrample }
    }
    private var baseUnblockable: Bool = false
    var unblockable: Bool {
        get { return applyContinuousEffects().baseUnblockable }
        set (newUnblockable) { baseUnblockable = newUnblockable }
    }
    private var baseVigilance: Bool = false
    var vigilance: Bool {
        get { return applyContinuousEffects().baseVigilance }
        set (newVigilance) { baseVigilance = newVigilance }
    }
    
    private weak var owner: Player?
    weak var controller: Player?
    var attacking: Bool = false
    var blocked: Bool = false
    var blockers: [Object] = []
    var blocking: Bool = false
    var attackers: [Object] = []
    var markedDamage: Int = 0
    var damagedByDeathtouch = false
    
    private var tapped: Bool = false
    var isTapped: Bool {
        return tapped
    }
    
    var turnEnteredBattlefield: Int?
    
    // TODO: Some way of reusing old ids / guaranteeing always have one
    static var currentId: Int = 0
    static func GetId() -> Int {
        currentId = currentId + 1
        return currentId
    }
    
    func exists() -> Bool {
        //TODO: Don't know if this'll work with flicker and stuff
        return !getController().getPermanents().filter({ $0.id == self.id }).isEmpty
    }
    
    init(name:String, id: Int? = nil) {
        self.id = id ?? Object.GetId()
        self.name = name
        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Object(name: name!, id: id)
        copy.colors = colors
        copy.manaCost = manaCost
        copy.supertypes = supertypes
        copy.types = types
        copy.subtypes = subtypes
        copy.basePower = basePower
        copy.baseToughness = baseToughness
        copy.effects = effects
        copy.activeEffects = activeEffects
        copy.counters = counters
        copy.attachedTo = attachedTo
        copy.auraRestriction = auraRestriction
        copy.activatedAbilities = activatedAbilities
        copy.triggeredAbilities = triggeredAbilities
        
        copy.baseDeathtouch = baseDeathtouch
        copy.baseDefender = baseDefender
        copy.baseEntersTapped = baseEntersTapped
        copy.baseFlash = baseFlash
        copy.baseFlying = baseFlying
        copy.baseHaste = baseHaste
        copy.baseIndestructible = baseIndestructible
        copy.baseLifelink = baseLifelink
        copy.baseReach = baseReach
        copy.baseTrample = baseTrample
        copy.baseVigilance = baseVigilance
        copy.baseUnblockable = baseUnblockable
        
        copy.owner = owner
        copy.controller = controller
        copy.attacking = attacking
        copy.blocked = blocked
        copy.blockers = blockers
        copy.blocking = blocking
        copy.attackers = attackers
        copy.markedDamage = markedDamage
        copy.damagedByDeathtouch = damagedByDeathtouch
        copy.tapped = tapped
        copy.turnEnteredBattlefield = turnEnteredBattlefield
        
        return copy
    }
    
    func getName() -> String {
        return name!
    }
    
    func setOwner(owner: Player) {
        self.owner = owner
        self.controller = owner
    }
    
    func getOwner() -> Player {
        return owner!
    }
    
    func setController(controller: Player) {
        self.controller = controller
    }
    
    func getController() -> Player {
        return controller!
    }
    
    func getOpponent() -> Player {
        return controller!.getOpponent()
    }
    
    func isToken() -> Bool {
        return false
    }
    
    func setManaCost(_ manaCostString: String, setColorAccordingly: Bool = true) {
        manaCost = ManaCost(manaCostString)
        if setColorAccordingly {
            colors = manaCost!.getColors()
        }
    }
    
    func getConvertedManaCost() -> Int {
        if let manaCost = manaCost {
            return manaCost.converted()
        }
        return 0 // nil?
    }
    
    private func clearTypes() {
        supertypes.removeAll()
        types.removeAll()
        subtypes.removeAll()
    }
    func addType(_ type: Type) { types.insert(type) }
    func addType(_ supertype: Supertype) { supertypes.insert(supertype) }
    func addType(_ subtype: Subtype) { subtypes.insert(subtype) }
    func setType(_ type: Type) { clearTypes(); addType(type); }
    func setType(_ type: Type, _ subtype: Subtype) { clearTypes(); addType(type); addType(subtype); }
    func setType(_ type1: Type, _ type2: Type, _ subtype: Subtype) { clearTypes(); addType(type1); addType(type2); addType(subtype); }
    func setType(_ type: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(type); addType(subtype1); addType(subtype2); }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype); }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype1); addType(subtype2); }
    func isType(_ type: Type) -> Bool { return types.contains(type) }
    func isType(_ supertype: Supertype) -> Bool { return supertypes.contains(supertype) }
    func isType(_ subtype: Subtype) -> Bool { return subtypes.contains(subtype) }
    func isColor(_ color: Color) -> Bool { return colors.contains(color) }
    func isColorless() -> Bool { return colors.isEmpty }
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    func isSpell() -> Bool { return false }
    
    func tap() {
        if !tapped {
            triggerAbilities(.ThisBecomesTapped)
        }
        tapped = true
    }
    func untap() {
        tapped = false
    }
    // Doesn't trigger anything
    func setTapped(_ tapped: Bool) {
        self.tapped = tapped
    }
    
    func addEffect(_ effect: @escaping () -> Void) {
        effects.append(UntargetedEffect(effect))
    }
    func addEffect(_ effect: TargetedEffect) {
        effects.append(effect)
    }
    
    func addContinuousEffect(_ continuousEffect: ContinuousEffect) {
        activeEffects.append(continuousEffect)
    }
    
    func addStaticAbility(_ effect: @escaping (Object) -> Object, allZones: Bool = false) {
        staticAbilities.append(StaticAbility(effect, allZones: allZones))
    }
    
    func addCounters(_ type: Counter, _ amount: Int) {
        for _ in 0 ..< amount {
            addCounter(type)
        }
    }
    func addCounter(_ type: Counter) {
        counters[type] = (counters[type] ?? 0) + 1
        if type == Counter.Lore {
            triggerAbilities(.ThisGetsLoreCounter)
        }
    }
    func getCounters(_ type: Counter) -> Int {
        return counters[type] ?? 0
    }
    func hasCounter(_ type: Counter) -> Bool {
        return counters[type] != nil
    }
    
    func addEnchantAbility(restriction: @escaping (Object) -> Bool, effect: @escaping (Object) -> Object) {
        self.auraRestriction = restriction
        addEffect(TargetedEffect.SingleObject(
            restriction: restriction,
            effect: { self.attachTo($0) }))
        addStaticAbility({ object in
            if self.isAttachedTo(object) {
                return effect(object)
            }
            return object
        })
    }
    func attachTo(_ object: Object) {
        self.attachedTo = object
    }
    func isAttachedTo(_ object: Object) -> Bool {
        if let attachedTo = self.attachedTo {
            return attachedTo.id == object.id
        }
        return false
    }
    func canEnchant(_ object: Object) -> Bool {
        return self.isType(.Aura) && self.auraRestriction != nil && auraRestriction!(object)
    }
    
    func applyContinuousEffects() -> Object {
        // TODO: Layers
        var object = self.copy() as! Object
        for activeEffect in activeEffects {
            object = activeEffect.apply(object)
        }
        
        // TODO: Should this be part of activeEffects? maybe custom getter
        for staticAbility in Game.shared.getStaticAbilities() {
            object = staticAbility.apply(object)
        }
        
        if object.basePower != nil && object.baseToughness != nil {
            let plusOnePlusOneCounters = getCounters(.PlusOnePlusOne)
            object.power = object.getBasePower() + plusOnePlusOneCounters
            object.toughness = object.getBaseToughness() + plusOnePlusOneCounters
        }
            
        return object
    }

    func addTriggeredAbility(trigger: Trigger, effect: @escaping () -> Void, restriction: @escaping () -> Bool = { return true }) {
        triggeredAbilities.append(UntargetedTriggeredAbility(source: self, trigger: trigger, effect: effect, restriction: restriction))
    }
    func addTriggeredAbility(trigger: Trigger, effect: TargetedEffect, restriction: @escaping () -> Bool = { return true }) {
        triggeredAbilities.append(TargetedTriggeredAbility(source: self, trigger: trigger, effect: effect, restriction: restriction))
    }
    
    func triggerAbilities(_ trigger: Trigger) {
        for triggeredAbility in triggeredAbilities {
            if triggeredAbility.getTrigger() == trigger {
                triggeredAbility.triggerAbility()
            }
        }
    }
    
    func addReplacementEffect(event: Trigger, effect: @escaping () -> Void) {
        replacementEffects.append(ReplacementEffect(source: self, event: event, effect: effect))
    }
    
    func replaceEvent(_ event: Trigger) {
        // TODO: prevent normal things from happening
        for replacementEffect in replacementEffects {
            if replacementEffect.getEvent() == event {
                replacementEffect.replace()
            }
        }
    }
    
    func addActivatedAbility(string: String, cost: Cost, effect: @escaping () -> Void, manaAbility: Bool = false) {
        activatedAbilities.append(UntargetedActivatedAbility(source: self, string: string, cost: cost, effect: effect, manaAbility: manaAbility))
    }
    func addActivatedAbility(string: String, cost: Cost, effect: TargetedEffect, manaAbility: Bool = false) {
        activatedAbilities.append(TargetedActivatedAbility(source: self, string: string, cost: cost, effect: effect, manaAbility: manaAbility))
    }
    
    func canActivateAbilities() -> Bool {
        return !activatedAbilities.isEmpty && !Game.shared.isSelecting() && getController().hasPriority
    }
    
    func isSelectingAbility() -> Bool {
        return Game.shared.isSelectingAbility && Game.shared.selectingAbilityObject!.id == self.id
    }
    
    func requiresTargets() -> Bool {
        return effects.contains(where: { $0.requiresTarget() })
    }
    
    func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve()
            }
        }
    }
    
    func getBasePower() -> Int {
        return basePower!
    }
    func getPower() -> Int {
        return applyContinuousEffects().basePower!
    }
    func pump(_ power: Int, _ toughness: Int) {
        addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
            object.power = object.getBasePower() + power
            object.toughness = object.getBaseToughness() + toughness
            return object
        }))
    }
    func getBaseToughness() -> Int {
        return baseToughness!
    }
    func getToughness() -> Int {
        return applyContinuousEffects().baseToughness!
    }
    
    func hasSummoningSickness() -> Bool {
        if !isType(.Creature) {
            return false
        }
        if haste {
            return false
        }
        if let turnEnteredBattlefield = turnEnteredBattlefield {
            let currentTurn = Game.shared.getCurrentTurn()
            return getController().active ? (turnEnteredBattlefield >= currentTurn) : (turnEnteredBattlefield >= currentTurn - 1)
        }
        return false
    }
    
    func canAttack() -> Bool {
        return Game.shared.isDeclaringAttackers() && getController().active && isType(.Creature) && !hasSummoningSickness() && !defender && !tapped
    }
    
    func canBlock() -> Bool {
        return Game.shared.isDeclaringBlockers() && !getController().active && isType(.Creature) && !tapped && attackers.isEmpty
    }
    
    func canBlockAttacker(_ attacker: Object) -> Bool {
        if attacker.unblockable { return false }
        if attacker.flying && !(flying || reach) { return false }
        return true
    }
    
    func block(_ attacker: Object) {
        assert(canBlockAttacker(attacker))
        attacker.blockers.append(self)
        attacker.blocked = true
        self.attackers.append(attacker)
    }
    
    func bounce() {
        getController().bouncePermanent(self)
    }
    
    func discard() {
        getController().discardCard(self)
    }
    
    func destroy(ignoreIndestructible: Bool = false) -> Bool {
        if !indestructible || ignoreIndestructible {
            getController().destroyPermanent(self)
            return true
        }
        return false
    }
    
    func sacrifice() {
        let _ = self.destroy(ignoreIndestructible: true)
    }
    
    private func hasDealtDamage(amount: Int) {
        if lifelink {
            getController().gainLife(amount)
        }
    }
    
    override func takeDamage(_ amount: Int) {
        markedDamage += amount
        triggerAbilities(.ThisDealtDamage)
    }
    
    func damage(to recipient: Targetable, _ amount: Int) {
        recipient.takeDamage(amount)
        hasDealtDamage(amount: amount)
        if let objectRecipient = recipient as? Object {
            if deathtouch {
                objectRecipient.damagedByDeathtouch = true
            }
        }
    }
    
    func fight(_ opponent: Object) {
        self.damage(to: opponent, max(getPower(), 0))
        opponent.damage(to: self, max(opponent.getPower(), 0))
    }
    
    func removeDamage() {
        markedDamage = 0
    }
    
    func removeUntilEndOfTurnEffects() {
        activeEffects.removeAll()
    }
}

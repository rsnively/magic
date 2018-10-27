import Foundation

class Object: Targetable, NSCopying {
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
    
    var activatedAbilities:[ActivatedAbility] = []
    var triggeredAbilities:[TriggeredAbility] = []
    
    private var baseDeathtouch: Bool = false
    var deathtouch: Bool {
        get { return applyContinuousEffects().baseDeathtouch}
        set (newDeathtouch) { baseDeathtouch = newDeathtouch }
    }
    var defender: Bool = false
    var entersTapped: Bool = false
    var flash: Bool = false
    private var baseFlying: Bool = false
    var flying: Bool {
        get { return applyContinuousEffects().baseFlying }
        set (newFlying) { baseFlying = newFlying }
    }
    private var baseHaste: Bool = false
    var haste: Bool {
        get { return applyContinuousEffects().baseHaste }
        set (newHaste) { baseHaste = newHaste }
    }
    var lifelink: Bool = false
    private var baseReach: Bool = false
    var reach: Bool {
        get { return applyContinuousEffects().baseReach }
        set (newReach) { baseReach = newReach }
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
    
    init(name:String) {
        self.name = name
        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Object(name: name!)
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
        copy.activatedAbilities = activatedAbilities
        copy.triggeredAbilities = triggeredAbilities
        
        copy.baseDeathtouch = baseDeathtouch
        copy.defender = defender
        copy.entersTapped = entersTapped
        copy.flash = flash
        copy.baseFlying = baseFlying
        copy.baseHaste = baseHaste
        copy.lifelink = lifelink
        copy.baseReach = baseReach
        copy.baseVigilance = baseVigilance
        
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
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    func isSpell() -> Bool { return false }
    
    func tap() {
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
    
    func addCounters(_ type: Counter, _ amount: Int) {
        counters[type] = (counters[type] ?? 0) + amount
    }
    func addCounter(_ type: Counter) {
        counters[type] = (counters[type] ?? 0) + 1
    }
    
    func applyContinuousEffects() -> Object {
        var object = self.copy() as! Object
        for activeEffect in activeEffects {
            object = activeEffect.apply(object)
        }
        
        if object.basePower != nil && object.baseToughness != nil {
            let plusOnePlusOneCounters = counters[.PlusOnePlusOne] ?? 0
            object.power = object.getBasePower() + plusOnePlusOneCounters
            object.toughness = object.getBaseToughness() + plusOnePlusOneCounters
        }
            
        return object
    }

    func addTriggeredAbility(trigger: Trigger, effect: @escaping () -> Void) {
        triggeredAbilities.append(UntargetedTriggeredAbility(source: self, trigger: trigger, effect: effect))
    }
    func addTriggeredAbility(trigger: Trigger, effect: TargetedEffect) {
        triggeredAbilities.append(TargetedTriggeredAbility(source: self, trigger: trigger, effect: effect))
    }
    
    
    func triggerAbilities(_ trigger: Trigger) {
        for triggeredAbility in triggeredAbilities {
            if triggeredAbility.getTrigger() == trigger {
                triggeredAbility.triggerAbility()
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
        return !activatedAbilities.isEmpty && !Game.shared.isSelectingAbility && !Game.shared.isTargeting && !Game.shared.isDeclaringAttackers() && !Game.shared.isDeclaringBlockers() && getController().hasPriority
    }
    
    func isSelectingAbility() -> Bool {
        return Game.shared.isSelectingAbility && Game.shared.selectingAbilityObject! === self
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
        getController().discard(self)
    }
    
    func destroy() {
        getController().destroyPermanent(self)
    }
    
    private func hasDealtDamage(amount: Int) {
        if lifelink {
            getController().gainLife(amount)
        }
    }
    
    override func takeDamage(_ amount: Int) {
        markedDamage += amount
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

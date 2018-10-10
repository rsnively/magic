import Foundation

class Object: NSObject, NSCopying {
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
    
    var activatedAbilities:[ActivatedAbility] = []
    var triggeredAbilities:[TriggeredAbility] = []
    
    var defender: Bool = false
    var flying: Bool = false
    var flash: Bool = false
    var lifelink: Bool = false
    var vigilance: Bool = false
    
    private weak var owner: Player?
    weak var controller: Player?
    var attacking: Bool = false
    var blocked: Bool = false
    var blockers: [Object] = []
    var blocking: Bool = false
    var attackers: [Object] = []
    var markedDamage: Int = 0
    
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
        copy.activatedAbilities = activatedAbilities
        copy.triggeredAbilities = triggeredAbilities
        
        copy.defender = defender
        copy.flash = flash
        copy.flying = flying
        copy.lifelink = lifelink
        copy.vigilance = vigilance
        
        copy.owner = owner
        copy.controller = controller
        copy.attacking = attacking
        copy.blocked = blocked
        copy.blockers = blockers
        copy.blocking = blocking
        copy.attackers = attackers
        copy.markedDamage = markedDamage
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
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    
    func tap() {
        tapped = true
    }
    func untap() {
        tapped = false
    }
    
    func addEffect(_ effect: Effect) {
        effects.append(effect)
    }
    
    func addContinuousEffect(_ continuousEffect: ContinuousEffect) {
        activeEffects.append(continuousEffect)
    }
    
    func applyContinuousEffects() -> Object {
        var object = self.copy() as! Object
        for activeEffect in activeEffects {
            object = activeEffect.apply(object)
        }
        return object
    }
    
    func addTriggeredAbility(_ triggeredAbility: TriggeredAbility) {
        triggeredAbilities.append(triggeredAbility)
    }
    
    func triggerAbilities(_ trigger: Trigger) {
        for triggeredAbility in triggeredAbilities {
            if triggeredAbility.getTrigger() == trigger {
                triggeredAbility.triggerAbility()
            }
        }
    }
    
    func addActivatedAbility(_ activatedAbility: ActivatedAbility) {
        activatedAbilities.append(activatedAbility)
    }
    
    func canActivateAbilities() -> Bool {
        return !activatedAbilities.isEmpty && !Game.shared.isTargeting && !Game.shared.isDeclaringAttackers() && getController().hasPriority
    }
    
    func requiresTargets() -> Bool {
        return effects.contains(where: { $0.requiresTarget() })
    }
    
    func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve(source: self)
            }
        }
    }
    
    func getBasePower() -> Int {
        return basePower!
    }
    func getPower() -> Int {
        return applyContinuousEffects().basePower!
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
        return !attacker.flying || self.flying
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
    
    // has damage dealt to it
    func dealDamage(_ amount: Int) {
        markedDamage += amount
    }
    
    func removeDamage() {
        markedDamage = 0
    }
    
    func removeUntilEndOfTurnEffects() {
        activeEffects.removeAll()
    }
    
    // This permanent is dealing damage equal to its power to something
    func dealsDamage() {
        if lifelink {
            getController().gainLife(getPower())
        }
    }
    
}

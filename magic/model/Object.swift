import Foundation

class Object: Targetable, Hashable, NSCopying {
    private var id:Int
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
    var spellAbility: Effect?
    var activeEffects: [ContinuousEffect] = []
    var counters: [Counter: Int] = [:]
    
    var startingLoyalty: Int?
    private var lastTurnActivatedLoyaltyAbility: Int?
    var hasActivatedLoyaltyAbilityThisTurn: Bool {
        get {
            if let turn = lastTurnActivatedLoyaltyAbility {
                return turn == Game.shared.getCurrentTurn()
            }
            return false
        }
        set (shouldBeTrue) {
            assert(shouldBeTrue)
            lastTurnActivatedLoyaltyAbility = Game.shared.getCurrentTurn()
        }
    }
    
    var attachedTo: Object?
    var auraRestriction: TargetingRestriction?
    
    var activatedAbilities:[ActivatedAbility] = []
    var staticAbilities:[StaticAbility] = []
    var characteristicDefiningAbilities:[StaticAbility] = []
    var triggeredAbilities:[TriggeredAbility] = []
    var replacementEffects:[ReplacementEffect] = []
    
    private var baseCanAttackWithDefender: Bool = false
    var canAttackWithDefender: Bool {
        get { return applyContinuousEffects().baseCanAttackWithDefender }
        set (newCanAttackWithDefender) { baseCanAttackWithDefender = newCanAttackWithDefender }
    }
    private var baseCantActivateAbilities: Bool = false
    var cantActivateAbilities: Bool {
        get { return applyContinuousEffects().baseCantActivateAbilities }
        set (newCantActivateAbilities) { baseCantActivateAbilities = newCantActivateAbilities }
    }
    private var baseCantAttack: Bool = false
    var cantAttack: Bool {
        get { return applyContinuousEffects().baseCantAttack }
        set (newCantAttack) { baseCantAttack = newCantAttack }
    }
    private var baseCantBlock: Bool = false
    var cantBlock: Bool {
        get { return applyContinuousEffects().baseCantBlock }
        set (newCantBlock) { baseCantBlock = newCantBlock }
    }
    private var baseCastingCost: ManaCost?
    var castingCost: ManaCost? {
        get { return applyContinuousEffects().baseCastingCost }
        set (newCastingCost) { baseCastingCost = newCastingCost }
    }
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
    private var baseDoubleStrike: Bool = false
    var doubleStrike: Bool {
        get { return applyContinuousEffects().baseDoubleStrike }
        set (newDoubleStrike) { baseDoubleStrike = newDoubleStrike }
    }
    private var baseEntersTapped: Bool = false
    var entersTapped: Bool {
        get { return applyContinuousEffects().baseEntersTapped }
        set (newEntersTapped) { baseEntersTapped = newEntersTapped }
    }
    private var baseFirstStrike: Bool = false
    var firstStrike: Bool {
        get { return applyContinuousEffects().baseFirstStrike }
        set (newFirstStrike) { baseFirstStrike = newFirstStrike }
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
    private var baseHexproof: Bool = false
    var hexproof: Bool {
        get { return applyContinuousEffects().baseHexproof }
        set (newHexproof) { baseHexproof = newHexproof }
    }
    override func isHexproof() -> Bool {
        return hexproof
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
    private var baseUncounterable: Bool = false
    var uncounterable: Bool {
        get { return applyContinuousEffects().baseUncounterable }
        set (newUncounterable) { baseUncounterable = newUncounterable }
    }
    private var baseVigilance: Bool = false
    var vigilance: Bool {
        get { return applyContinuousEffects().baseVigilance }
        set (newVigilance) { baseVigilance = newVigilance }
    }
    
    private weak var owner: Player?
    private weak var controller: Player?
    private var revealedToOwner: Bool = false
    private var revealedToOpponent: Bool = false
    
    private var attacking: Targetable?
    var isAttacking: Bool {
        get { return attacking != nil }
        set (shouldBeFalse) { assert(!shouldBeFalse); attacking = nil }
    }
    func getAttackTarget() -> Targetable? {
        return attacking
    }
    var blocked: Bool = false
    var blockers: [Object] = []
    var blocking: Bool = false
    var attackers: [Object] = []
    var markedDamage: Int = 0
    var damagedByDeathtouch = false
    var hasDealtDamage = false
    
    // For Determining what other creatures can block this one
    var blockabilityRequirements: [(Object) -> Bool] = []
    
    private var tapped: Bool = false
    var isTapped: Bool {
        return tapped
    }
    var untapsDuringNextUntapStep: Bool = true
    
    var turnEnteredBattlefield: Int?
    
    // TODO: Some way of reusing old ids / guaranteeing always have one
    static var currentId: Int = 0
    static func GetId() -> Int {
        currentId = currentId + 1
        return currentId
    }
    
    static func == (lhs: Object, rhs: Object) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func != (lhs: Object, rhs: Object) -> Bool {
        return lhs.id != rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func exists() -> Bool {
        //TODO: Don't know if this'll work with flicker and stuff
        return !getController().getPermanents().filter({ $0.id == self.id }).isEmpty
    }
    
    init(name:String?, id: Int? = nil) {
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
        copy.startingLoyalty = startingLoyalty
        copy.lastTurnActivatedLoyaltyAbility = lastTurnActivatedLoyaltyAbility
        copy.spellAbility = spellAbility
        copy.activeEffects = activeEffects
        copy.counters = counters
        copy.attachedTo = attachedTo
        copy.auraRestriction = auraRestriction
        copy.activatedAbilities = activatedAbilities
        copy.staticAbilities = staticAbilities
        copy.characteristicDefiningAbilities = characteristicDefiningAbilities
        copy.triggeredAbilities = triggeredAbilities
        copy.replacementEffects = replacementEffects
        
        copy.baseCanAttackWithDefender = baseCanAttackWithDefender
        copy.baseCantAttack = baseCantAttack
        copy.baseCantBlock = baseCantBlock
        copy.baseDeathtouch = baseDeathtouch
        copy.baseDefender = baseDefender
        copy.baseDoubleStrike = baseDoubleStrike
        copy.baseEntersTapped = baseEntersTapped
        copy.baseFirstStrike = baseFirstStrike
        copy.baseFlash = baseFlash
        copy.baseFlying = baseFlying
        copy.baseHaste = baseHaste
        copy.baseHexproof = baseHexproof
        copy.baseCastingCost = manaCost
        copy.baseIndestructible = baseIndestructible
        copy.baseLifelink = baseLifelink
        copy.baseReach = baseReach
        copy.baseTrample = baseTrample
        copy.baseUnblockable = baseUnblockable
        copy.baseUncounterable = baseUncounterable
        copy.baseVigilance = baseVigilance
        
        copy.owner = owner
        copy.controller = controller
        copy.revealedToOwner = revealedToOwner
        copy.revealedToOpponent = revealedToOpponent
        copy.attacking = attacking
        copy.blocked = blocked
        copy.blockers = blockers
        copy.blocking = blocking
        copy.attackers = attackers
        copy.markedDamage = markedDamage
        copy.damagedByDeathtouch = damagedByDeathtouch
        copy.hasDealtDamage = hasDealtDamage
        copy.tapped = tapped
        copy.untapsDuringNextUntapStep = untapsDuringNextUntapStep
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
    
    func ownedByHuman() -> Bool {
        return getOwner() === Game.shared.player1
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
    func eachOpponent(_ f: (Player) -> Void) {
        controller!.eachOpponent(f)
    }
    
    func getZone() -> Zone {
        if getController().getPermanents().contains(self) {
            return .Battlefield
        }
        if getController().getHand().contains(self) {
            return .Hand
        }
        if getController().getGraveyard().contains(self) {
            return .Graveyard
        }
        if getController().getLibrary().contains(self) {
            return .Library
        }
        if Game.shared.exile.contains(self) {
            return .Exile
        }
        if Game.shared.theStack.contains(self) {
            return .Stack
        }
        if Game.shared.commandZone.contains(self) {
            return .Command
        }
        assert(false)
        return .Command
    }
    
    private func setRevealedToOwner(_ revealed: Bool) {
        revealedToOwner = revealed
    }
    private func setRevealedToOpponent(_ revealed: Bool) {
        revealedToOpponent = revealed
    }
    func isRevealedToOwner() -> Bool {
        return revealedToOwner
    }
    func isRevealedToOpponent() -> Bool {
        return revealedToOpponent
    }
    func isRevealedToHuman() -> Bool {
        return (getController() === Game.shared.player1 && isRevealedToOwner()) || (getController() === Game.shared.player2 && isRevealedToOpponent())
    }
    
    func revealToOwner() {
        setRevealedToOwner(true)
    }
    func revealToOpponent() {
        setRevealedToOpponent(true)
    }
    func revealTo(_ player: Player) {
        if player === getOwner() {
            revealToOwner()
        } else {
            revealToOpponent()
        }
    }
    func reveal() {
        revealToOwner()
        revealToOpponent()
    }
    
    func hideFromOwner() {
        setRevealedToOwner(false)
    }
    func hideFromOpponent() {
        setRevealedToOpponent(false)
    }
    func hideFrom(_ player: Player) {
        if player === getOwner() {
            hideFromOwner()
        } else {
            hideFromOpponent()
        }
    }
    func hide() {
        hideFromOwner()
        hideFromOpponent()
    }
    
    func isToken() -> Bool {
        return false
    }
    
    func setManaCost(_ manaCostString: String, setColorAccordingly: Bool = true) {
        manaCost = ManaCost(manaCostString)
        castingCost = ManaCost(manaCostString)
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
    func setType(_ type: Type, _ subtype1: Subtype, _ subtype2: Subtype, _ subtype3: Subtype) { clearTypes(); addType(type); addType(subtype1); addType(subtype2); addType(subtype3); }
    func setType(_ type1: Type, _ type2: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(type1); addType(type2); addType(subtype1); addType(subtype2); }
    func setType(_ supertype: Supertype, _ type: Type) { clearTypes(); addType(supertype); addType(type) }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype); }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype1); addType(subtype2); }
    func isType(_ type: Type) -> Bool { return types.contains(type) }
    func isType(_ supertype: Supertype) -> Bool { return supertypes.contains(supertype) }
    func isType(_ subtype: Subtype) -> Bool { return subtypes.contains(subtype) }
    func isBasicLand() -> Bool { return isType(.Basic) && isType(.Land) }
    func isColor(_ color: Color) -> Bool { return colors.contains(color) }
    func isColorless() -> Bool { return colors.isEmpty }
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    // Technically, a card has to be on the stack to be a spell
    func isSpell() -> Bool { return !self.types.contains(Type.Land) }

    
    func canBeAttacked() -> Bool { return isType(.Planeswalker) }
    
    func tap(declaredAsAttacker: Bool = false) {
        if !tapped {
            triggerAbilities(.ThisBecomesTapped)
            if !declaredAsAttacker && isType(.Creature) {
                eachOpponent({ $0.triggerAbilities(.CreatureOpponentControlsBecomesTappedBesidesAttacking) })
            }
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
        self.spellAbility = UntargetedEffect(effect: effect)
    }
    func addEffect(_ effect: TargetedEffect) {
        self.spellAbility = effect
    }
    
    func addContinuousEffect(_ continuousEffect: ContinuousEffect) {
        activeEffects.append(continuousEffect)
    }
    
    func addStaticAbility(_ effect: @escaping (Object) -> Object, characteristicDefining: Bool = false, allZones: Bool = false) {
        let ability = StaticAbility(effect, allZones: allZones)
        if characteristicDefining {
            characteristicDefiningAbilities.append(ability)
        } else {
            staticAbilities.append(ability)
        }
    }
    
    private func addCounter_impl(_ type: Counter) {
        counters[type] = (counters[type] ?? 0) + 1
    }
    func addCounters(_ type: Counter, _ amount: Int) {
        let amount = max(amount, 0)
        for _ in 0 ..< amount {
            addCounter_impl(type)
        }
        if type == Counter.Lore {
            triggerAbilities(.ThisGetsLoreCounter)
        }
        else if type == Counter.PlusOnePlusOne {
            triggerAbilities(.ThisGetsPlusOnePlusOneCounter)
        }
    }
    func addCounter(_ type: Counter) {
        addCounter_impl(type)
        if type == Counter.Lore {
            triggerAbilities(.ThisGetsLoreCounter)
        }
        else if type == Counter.PlusOnePlusOne {
            triggerAbilities(.ThisGetsPlusOnePlusOneCounter)
        }
    }
    func removeCounter(_ type: Counter) {
        counters[type] = max(0, (counters[type] ?? 0) - 1)
    }
    func removeCounters(_ type: Counter, _ amount: Int) {
        let amount = max(amount, 0)
        for _ in 0 ..< amount {
            removeCounter(type)
        }
    }
    func getCounters(_ type: Counter) -> Int {
        return counters[type] ?? 0
    }
    func hasCounter(_ type: Counter) -> Bool {
        return counters[type] != nil
    }
    func hasCounters(_ counterArray: [Counter]) -> Bool {
        var counterMap:[Counter: Int] = [:]
        for counter in counterArray {
            counterMap[counter] = (counterMap[counter] ?? 0) + 1
        }
        for (type, count) in counterMap {
            if getCounters(type) < count {
                return false
            }
        }
        return true
    }
    
    func addEnchantAbility(restriction: TargetingRestriction, effect: @escaping (Object) -> Object) {
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
        if let restriction = self.auraRestriction {
            return self.isType(.Aura) && restriction.meetsRestriction(target: object)
        }
        return false
    }
    
    func addEquipAbility(string: String, cost: Cost, effect: @escaping (Object) -> Object, restriction: @escaping (Object) -> Bool = { _ in return true }) {
        addActivatedAbility(
            string: string,
            cost: cost,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === self.getController() && restriction($0) },
                    zones: [.Battlefield]
                ),
                effect: { self.attachTo($0) }),
            manaAbility: false,
            sorcerySpeed: true)
        addStaticAbility({ object in
            if self.isAttachedTo(object) {
                return effect(object)
            }
            return object
        })
    }
    
    func applyContinuousEffects() -> Object {
        // TODO: Layers
        var object = self.copy() as! Object
        
        for cda in characteristicDefiningAbilities {
            object = cda.apply(object)
        }
        
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

    func addTriggeredAbility(
        trigger: Trigger,
        effect: @escaping () -> Void,
        effectOptional: Bool = false,
        restriction: @escaping () -> Bool = { return true },
        triggersInGraveyard: Bool = false
    ) {
        triggeredAbilities.append(
            UntargetedTriggeredAbility(
                source: self,
                trigger: trigger,
                effect: effect,
                effectOptional: effectOptional,
                restriction: restriction,
                triggersInGraveyard: triggersInGraveyard
        ))
    }
    
    func addTriggeredAbility(
        trigger: Trigger,
        effect: TargetedEffect,
        restriction: @escaping () -> Bool = { return true },
        triggersInGraveyard: Bool = false
    ) {
        triggeredAbilities.append(
            TargetedTriggeredAbility(
                source: self,
                trigger: trigger,
                effect: effect,
                restriction: restriction,
                triggersInGraveyard: triggersInGraveyard
        ))
    }
    
    func triggerAbilities(_ trigger: Trigger, inGraveyard: Bool = false) {
        for triggeredAbility in triggeredAbilities {
            if triggeredAbility.getTrigger() == trigger && (!inGraveyard || triggeredAbility.doesTriggerInGraveyard()) {
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
    
    func addActivatedAbility(string: String, cost: Cost, effect: @escaping () -> Void, manaAbility: Bool = false, sorcerySpeed: Bool = false, loyaltyAbility: Bool = false) {
        activatedAbilities.append(UntargetedActivatedAbility(source: self, string: string, cost: cost, effect: effect, manaAbility: manaAbility, sorcerySpeed: sorcerySpeed, loyaltyAbility: loyaltyAbility))
    }
    func addActivatedAbility(string: String, cost: Cost, effect: TargetedEffect, manaAbility: Bool = false, sorcerySpeed: Bool = false, loyaltyAbility: Bool = false) {
        activatedAbilities.append(TargetedActivatedAbility(source: self, string: string, cost: cost, effect: effect, manaAbility: manaAbility, sorcerySpeed: sorcerySpeed, loyaltyAbility: loyaltyAbility))
    }
    
    func canActivateAbilities() -> Bool {
        return !cantActivateAbilities
            && !activatedAbilities.isEmpty
            && (!Game.shared.isSelecting() || (Game.shared.isCastingSpell && !activatedAbilities.filter({ $0.isManaAbility() }).isEmpty))
            && getController().hasPriority
    }
    
    func isSelectingAbility() -> Bool {
        return Game.shared.isSelectingAbility && Game.shared.selectingAbilityObject!.id == self.id
    }
    
    func requiresTargets() -> Bool {
        if let spellAbility = spellAbility {
            return spellAbility.requiresTarget()
        }
        return false
    }
    
    func resolve() {
        spellAbility?.resolve()
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
    
    func powerOrToughnessUndefined() -> Bool {
        return basePower == nil || baseToughness == nil
    }
    
    func getBaseCastingCost() -> ManaCost {
        return baseCastingCost!
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
        return Game.shared.isDeclaringAttackers()
            && getController().active
            && isType(.Creature)
            && !isAttacking
            && !hasSummoningSickness()
            && !cantAttack
            && (!defender || baseCanAttackWithDefender)
            && !tapped
    }
    
    func canBlock() -> Bool {
        return Game.shared.isDeclaringBlockers() && !getController().active && isType(.Creature) && !blocking && !tapped && attackers.isEmpty
    }
    
    func canBlockAttacker(_ attacker: Object) -> Bool {
        for requirement in attacker.blockabilityRequirements {
            if !requirement(self) {
                return false
            }
        }
        if attacker.unblockable { return false }
        if self.cantBlock { return false }
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
        removeFromCombat()
        getController().bouncePermanent(self)
        triggerAbilities(.ThisLTB)
    }
    
    func putIntoHand() {
        removeFromCombat()
        getOwner().putIntoHand(self);
    }
    
    func putOntoBattlefield(tapped: Bool = false) {
        getController().addPermanent(self, tapped: tapped);
    }
    
    func putOnTopOfLibrary() {
        removeFromCombat()
        getOwner().putOnTopOfLibrary(self)
    }
    
    func counter() {
        // TODO: Right now you can counter yourself, but this will be cleaned up once targeting happens before you get added to the stack
        assert(getZone() == .Stack)
        if !uncounterable {
            getOwner().counter(self)
        }
    }
    
    func discard() {
        assert(getZone() == .Hand)
        getOwner().discardCard(self)
    }
    
    func destroy(ignoreIndestructible: Bool = false) -> Bool {
        if !indestructible || ignoreIndestructible {
            removeFromCombat()
            getController().destroyPermanent(self)
            triggerAbilities(.ThisLTB)
            return true
        }
        return false
    }
    
    func exile() {
        removeFromCombat()
        getOwner().exileObject(self)
        if getController().getPermanents().firstIndex(where: { $0 == self }) != nil {
            triggerAbilities(.ThisLTB)
        }
    }
    
    func sacrifice() {
        let _ = self.destroy(ignoreIndestructible: true)
        if isType(.Treasure) {
            getController().triggerAbilities(.YouSacrificeTreasure)
        }
        triggerAbilities(.ThisLTB)
    }
    
    private func dealsDamage(amount: Int) {
        if amount > 0 {
            hasDealtDamage = true
        }
        if lifelink {
            getController().gainLife(amount)
        }
    }
    
    override func takeDamage(_ amount: Int) {
        let amount = max(amount, 0)
        if isType(.Creature) {
            markedDamage += amount
        }
        else if isType(.Planeswalker) {
            removeCounters(.Loyalty, amount)
        }
        triggerAbilities(.ThisDealtDamage)
    }
    
    func damage(to recipient: Targetable?, _ amount: Int, combatDamage: Bool = false) {
        if let recipient = recipient {
            recipient.takeDamage(amount)
            dealsDamage(amount: amount)
            if let objectRecipient = recipient as? Object {
                if deathtouch {
                    objectRecipient.damagedByDeathtouch = true
                }
            }
            if let _ = recipient as? Player {
                if amount > 0 && combatDamage {
                    triggerAbilities(.ThisDealsCombatDamageToPlayer)
                }
            }
        }
    }
    
    func attack(_ target: Targetable) {
        if let objectTarget = target as? Object {
            assert(objectTarget.isType(.Planeswalker))
        }
        attacking = target
    }
    
    func fight(_ opponent: Object) {
        self.damage(to: opponent, getPower())
        opponent.damage(to: self, opponent.getPower())
    }
    
    func removeFromCombat() {
        attacking = nil
        blocking = false
        blockers.removeAll()
        attackers.removeAll()
        blocked = false
    }
    
    func removeDamage() {
        markedDamage = 0
    }
    
    func removeUntilEndOfTurnEffects() {
        activeEffects.removeAll()
    }
}

import Foundation

class Player: Targetable {
    private var life = 20
    private var library: [Object]
    private var hand: [Object] = []
    private var permanents: [Object] = []
    private var graveyard: [Object] = []
    private var manaPool: ManaPool = ManaPool()

    var active = false
    var hasPriority = false
    var cardsToDiscard: Int = 0
    var isDiscarding: Bool {
        get { return cardsToDiscard > 0 }
    }
    var lifeGainedThisTurn = 0
    var attackedWithCreatureThisTurn = false
    
    var citysBlessing = false
    
    init(deck: [Card]) {
        self.library = deck
        super.init()
        library.forEach({ $0.setOwner(owner: self) })
        for card in library {
            card.setOwner(owner: self)
        }
        
        for _ in 0..<1 {
            permanents.append(GRN.Plains())
            permanents.append(GRN.Island())
            permanents.append(GRN.Swamp())
            permanents.append(GRN.Mountain())
            permanents.append(GRN.Forest())
        }
        graveyard.forEach({ $0.setOwner(owner: self); $0.reveal() })
        hand.forEach({ $0.setOwner(owner: self); $0.revealToOwner() })
        permanents.forEach({ $0.setOwner(owner: self); $0.reveal() })
        
        self.pregameActions()
    }
    
    func getOpponent() -> Player {
        return Game.shared.getOtherPlayer(self)
    }
    
    func getLife() -> Int {
        return life
    }
    
    func setLife(_ amount: Int) {
        if amount > getLife() {
            gainLife(amount - getLife())
        } else if amount < getLife() {
            loseLife(getLife() - amount)
        }
    }
    
    override func takeDamage(_ amount: Int) {
        let amount = max(amount, 0)
        self.loseLife(amount)
    }
    
    func loseLife(_ amount: Int) {
        life -= amount
    }
    
    func gainLife(_ amount: Int) {
        life += amount
        lifeGainedThisTurn += amount
        triggerAbilities(.YouGainLife)
    }
    
    func getLibrary() -> [Object] {
        return library
    }
    
    func getHand() -> [Object] {
        return hand
    }
    
    func getGraveyard() -> [Object] {
        return graveyard
    }
    
    func getPermanents() -> [Object] {
        return permanents
    }
    func getLands() -> [Object] {
        return permanents.filter { $0.isType(Type.Land) }
    }
    func getCreatures() -> [Object] {
        return permanents.filter { $0.isType(Type.Creature) }
    }
    func getAttackers() -> [Object] {
        return permanents.filter { $0.isAttacking }
    }
    func getArtifacts() -> [Object] {
        return permanents.filter { $0.isType(Type.Artifact) }
    }
    func getEnchantments() -> [Object] {
        return permanents.filter { $0.isType(Type.Enchantment) }
    }
    
    func getStaticAbilities() -> [StaticAbility] {
        var abilities: [StaticAbility] = []
        for permanent in getPermanents() {
            abilities += permanent.staticAbilities
        }
        for card in getHand() {
            for ability in card.staticAbilities {
                if ability.appliesInAllZones() {
                    abilities += [ability]
                }
            }
        }
        return abilities
    }
    
    func addMana(color: Color?, _ amount: Int = 1) {
        for _ in 0..<amount {
            manaPool.add(Mana(color))
        }
    }
    
    func getManaPool() -> ManaPool {
        return manaPool
    }
    
    func canCastSorcery() -> Bool {
        return Game.shared.theStack.isEmpty && active && Game.shared.getCurrentPhase().sorcerySpeed()
    }
    
    func canAfford(_ cost: Cost, source: Object) -> Bool {
        return manaPool.canAfford(cost.getManaCost())
            && ( !cost.getTapCost() || (!source.isTapped && !source.hasSummoningSickness()))
            && ( cost.getLifeCost() <= 0 || getLife() >= cost.getLifeCost())
            && ( source.hasCounters(cost.getRemoveCountersCost()))
    }
    
    func payFor(_ cost: Cost, _ source: Object) {
        manaPool.payFor(cost.getManaCost())
        if cost.getTapCost() {
            source.tap()
        }
        if cost.getSacrificeSelf() {
            source.sacrifice()
        }
        for counter in cost.getRemoveCountersCost() {
            source.removeCounter(counter)
        }
        for counter in cost.getAddCountersCost() {
            source.addCounter(counter)
        }
        loseLife(cost.getLifeCost())
    }
    
    func shuffleLibrary() {
        library.forEach({ $0.hide() })
        library.shuffle()
    }
    func shuffleGraveyardIntoLibrary() {
        graveyard.forEach({ $0.putOnTopOfLibrary() })
        shuffleLibrary()
    }
    
    func pregameActions() {
        shuffleLibrary()
        drawCards(7, noTrigger: true)
    }
    
    func drawCard(noTrigger: Bool = false) {
        // todo, milling
        let card = library.popLast()!
        card.revealToOwner()
        hand.append(card)
        if !noTrigger {
            triggerAbilities(.YouDrawCard)
        }
    }
    
    func drawCards(_ amt: Int, noTrigger: Bool = false) {
        for _ in 0..<amt {
            drawCard(noTrigger: noTrigger)
        }
    }
    
    func mill(_ amt: Int) {
        for _ in 0..<amt {
            if let card = library.popLast() {
                card.reveal()
                graveyard.append(card)
            }
        }
    }
    
    func untapAllPermanents() {
        for permanent in permanents {
            if permanent.isTapped {
                permanent.untap()
            }
        }
    }
    
    func givePriority() {
        
    }
    
    func triggerAbilities(_ trigger: Trigger) {
        permanents.forEach({ $0.triggerAbilities(trigger) })
        Game.shared.commandZone.filter({ $0.getController() === self }).forEach({ print("boop"); $0.triggerAbilities(trigger) })
    }
    
    func declareAttackers() {
        for permanent in permanents {
            if permanent.isAttacking {
                if permanent.isType(.Creature) {
                    attackedWithCreatureThisTurn = true
                }
                permanent.triggerAbilities(.ThisAttacks)
                if permanent.isType(.Creature) && permanent.flying {
                    Game.shared.bothPlayers({ $0.triggerAbilities(.CreatureWithFlyingAttacks) })
                }
                if !permanent.vigilance {
                    permanent.tap()
                }
            }
        }
    }
    
    func declareBlockers() {
        for permanent in permanents {
            if permanent.blocking {
                permanent.triggerAbilities(.ThisBlocks)
            }
        }
    }
    
    func chooseLegendaryToKeep(name: String) {
        Game.shared.choosingLegendaryToKeep = name
    }
    
    func dealCombatDamage(firstStrike: Bool = false) {
        for permanent in permanents {
            if permanent.isAttacking {
                if permanent.blocked {
                    //todo order blockers / double blocks
                    if let blocker = permanent.blockers.first {
                        
                        if (firstStrike && (permanent.firstStrike || permanent.doubleStrike)) || (!firstStrike && (!permanent.firstStrike || permanent.doubleStrike)) {
                            if permanent.trample {
                                let damageToBlocker = min(permanent.getPower(), blocker.getToughness())
                                let damageToPlayer = permanent.getPower() - damageToBlocker
                                permanent.damage(to: blocker, damageToBlocker)
                                permanent.damage(to: permanent.getAttackTarget(), damageToPlayer, combatDamage: true)
                            } else {
                                permanent.damage(to: blocker, permanent.getPower())
                            }
                        }
                        if (firstStrike && (blocker.firstStrike || blocker.doubleStrike)) || (!firstStrike && (!blocker.firstStrike || blocker.doubleStrike)) {
                            blocker.damage(to: permanent, blocker.getPower())
                        }
                    }
                } else {
                    permanent.damage(to: permanent.getAttackTarget(), permanent.getPower(), combatDamage: true)
                }
            }
        }
    }
    
    func removeCreaturesFromCombat() {
        permanents.forEach({ $0.removeFromCombat() })
    }
    
    func play(card:Card) {
        let cardIndex = hand.firstIndex(where: { $0 == card })!
        // TODO: Card's manaCost should be cost, and then we can use player.canAfford here
        if manaPool.canAfford(card) {
            hand.remove(at:cardIndex)
            manaPool.payFor(card)
            if (card.requiresTargets()) {
                Game.shared.targetingEffects.append(card.effects.first(where: { return $0.requiresTarget() })! as! TargetedEffect)
            }
            if card.usesStack() {
                Game.shared.theStack.push(card)
                Game.shared.checkStateBasedActions()
            }
            else {
                addPermanent(card)
                Game.shared.checkStateBasedActions()
            }
            
            if card.isSpell() && (card.isType(.Instant) || card.isType(.Sorcery)) {
                triggerAbilities(.YouCastInstantOrSorcery)
                triggerAbilities(.YouCastInstantOrSorcery)
            }
            if card.isSpell() && card.isType(.Creature) {
                triggerAbilities(.YouCastCreatureSpell)
            }
            if card.isSpell() && !card.isType(.Creature) {
                triggerAbilities(.YouCastNoncreatureSpell)
            }
            if card.isSpell() && card.isType(.Enchantment) {
                triggerAbilities(.YouCastEnchantmentSpell)
            }
            
            if card.isSpell() && card.isHistoric() {
                triggerAbilities(.YouCastHistoricSpell)
            }
            
            if card.isSpell() && card.isColor(.Blue) {
                triggerAbilities(.YouCastBlueSpell)
            }
            if card.isSpell() && card.colors.count > 1 {
                triggerAbilities(.YouCastMulticoloredSpell)
            }
        }
        else {
            return
        }
        
        if (card.isType(Type.Land)) {
            Game.shared.setLandPlayedThisTurn()
        }
        card.reveal()
    }
    
    func resolve(object: Object) {
        if object.isPermanent() {
            addPermanent(object)
        }
        else if object as? Card != nil {
            graveyard.append(object as! Card)
        }
        object.resolve()
    }
    
    func createToken(_ token: Object) {
        token.setController(controller: self)
        token.setOwner(owner: self)
        addPermanent(token)
    }
    func createEmblem(_ emblem: Object) {
        emblem.setController(controller: self)
        emblem.setOwner(owner: self)
        emblem.reveal()
        Game.shared.commandZone.append(emblem)
    }
    
    private func removeObjectFromCurrentZone(_ object: Object) {
        if let exileIndex = Game.shared.exile.firstIndex(where: { $0 == object }) {
            Game.shared.exile.remove(at: exileIndex)
        }
        else if let graveyardIndex = graveyard.firstIndex(where: { $0 == object }) {
            graveyard.remove(at: graveyardIndex)
        }
        else if let handIndex = hand.firstIndex(where: { $0 == object }) {
            hand.remove(at: handIndex)
        }
        else if let libraryIndex = library.firstIndex(where: { $0 == object }) {
            library.remove(at: libraryIndex)
        }
        else if let permanentIndex = permanents.firstIndex(where: { $0 == object }) {
            permanents.remove(at: permanentIndex)
        }
        // TODO: The stack
    }
    
    func addPermanent(_ object: Object, tapped: Bool = false) {
        removeObjectFromCurrentZone(object)
        object.reveal()
        permanents.append(object)
        if object.entersTapped || tapped {
            object.setTapped(true)
        }
        object.turnEnteredBattlefield = Game.shared.getCurrentTurn()
        object.replaceEvent(.ThisETB)
        if let loyalty = object.startingLoyalty {
            object.addCounters(.Loyalty, loyalty)
        }
        object.triggerAbilities(.ThisETB)
        if object.isType(.Land) {
            triggerAbilities(.Landfall)
        }
        if object.isType(.Creature) {
            triggerAbilities(.CreatureEntersBattlefieldUnderYourControl)
        }
    }
    
    func bouncePermanent(_ object: Object) {
        let index = permanents.firstIndex(where: { $0 == object })!
        permanents.remove(at: index)
        object.getOwner().hand.append(object)
    }
    
    func putIntoHand(_ object: Object) {
        removeObjectFromCurrentZone(object)
        object.revealToOwner()
        object.getOwner().hand.append(object)
    }
    
    func discard(_ amount: Int = 1) {
        cardsToDiscard += min(hand.count, amount)
    }
    
    func discardCard(_ object: Object) {
        let index = hand.firstIndex(where: { $0 == object })!
        hand.remove(at: index)
        object.reveal()
        graveyard.append(object)
    }
    
    func chooseCardToDiscard(_ object: Object) {
        discardCard(object)
        cardsToDiscard -= 1
    }
    
    func destroyPermanent(_ object: Object) {
        let index = permanents.firstIndex(where: { $0 == object })!
        permanents.remove(at: index)
        object.getOwner().graveyard.append(object)
        object.triggerAbilities(.ThisDies)
    }
    
    func exileObject(_ object: Object) {
        removeObjectFromCurrentZone(object)
        object.reveal()
        Game.shared.exile.append(object)
    }
    
    func revealHandTo(_ player: Player) {
        getHand().forEach({ $0.revealTo(player) })
    }
    
    func putOnTopOfLibrary(_ object: Object) {
        removeObjectFromCurrentZone(object)
        library.append(object)
    }
    
    func putOnBottomOfLibrary(_ objects: inout [Object], random: Bool) {
        if random {
            objects.forEach({ $0.hide() })
            objects.shuffle()
        }
        for object in objects {
            removeObjectFromCurrentZone(object)
            library.insert(object, at: 0)
        }
    }
    
    func chooseCards(from: [Object], restrictions: [(Object) -> Bool], action: @escaping ([Object], inout [Object]) -> Void) {
        from.forEach({ $0.revealTo(self) })
        Game.shared.selectingCardsFrom = from
        Game.shared.selectingCardsRestrictions = restrictions
        Game.shared.selectingCardsAction = action
    }
    func chooseCard(from: [Object], restriction: @escaping (Object) -> Bool, action: @escaping (Object?, inout [Object]) -> Void) {
        let action_: ([Object], inout [Object]) -> Void = { objects, rest in
            action(objects.first, &rest)
        }
        chooseCards(from: from, restrictions: [restriction], action: action_)
    }

}

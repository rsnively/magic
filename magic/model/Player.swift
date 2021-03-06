import Foundation

class Player: Targetable {
    static let startingLifeTotal = 20
    private var life = Player.startingLifeTotal
    private var sideboard: [Object]
    static let sideboardLimit = 15
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
    var numberCardsDrawnThisTurn = 0
    var numberSpellsCastThisTurn = 0
    var numberInstantsOrSorceriesCastThisTurn = 0
    
    var citysBlessing = false
    
    init(deck: [Card], sideboard: [Card]) {
        assert(sideboard.count <= Player.sideboardLimit)
        self.library = deck
        self.sideboard = sideboard
        super.init()
        library.forEach({ $0.setOwner(owner: self) })
        sideboard.forEach({ $0.setOwner(owner: self) })
        
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
    func eachOpponent(_ f: (Player) -> Void) {
        f(getOpponent())
    }
    func anyOpponent(_ f: (Player) -> Bool) -> Bool {
        return f(getOpponent())
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
    func getOtherCastableCards() -> [Object] {
        return Game.shared.exile.filter({ object in
            object.getController() === self && object.canCastFromExile
        })
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
    func getArtifactsAndEnchantments() -> [Object] {
        return permanents.filter { $0.isType(.Artifact) || $0.isType(.Enchantment) }
    }
    func controlsA(_ type: Type) -> Bool {
        return !permanents.filter({ $0.isType(type) }).isEmpty
    }
    func controlsA(_ type: Supertype) -> Bool {
        return !permanents.filter({ $0.isType(type) }).isEmpty
    }
    func controlsA(_ type: Subtype) -> Bool {
        return !permanents.filter({ $0.isType(type) }).isEmpty
    }
    
    func getCardsInExile() -> [Object] {
        return Game.shared.exile.filter({ $0.getOwner() === self })
    }
    
    func getSideboard() -> [Object] {
        return sideboard
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
        for card in getGraveyard() {
            for ability in card.staticAbilities {
                if ability.isCharacteristicDefining() {
                    abilities += [ability]
                }
            }
        }
        for card in getLibrary() {
            for ability in card.staticAbilities {
                if ability.isCharacteristicDefining() {
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
        
        if let castingSpell = Game.shared.castingSpell {
            if manaPool.canAfford(castingSpell.castingCost!) {
                finishCastingSpell(castingSpell as! Card)
            }
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
    func shuffleGraveyardAndHandIntoLibrary() {
        graveyard.forEach({ $0.putOnTopOfLibrary() })
        hand.forEach({ $0.putOnTopOfLibrary() })
        shuffleLibrary()
    }
    
    func pregameActions() {
        shuffleLibrary()
        drawCards(7, noTrigger: true)
    }
    
    func newTurn() {
        attackedWithCreatureThisTurn = false
        lifeGainedThisTurn = 0
        numberCardsDrawnThisTurn = 0
        numberSpellsCastThisTurn = 0
        numberInstantsOrSorceriesCastThisTurn = 0
    }
    
    func drawCard(noTrigger: Bool = false) {
        // todo, milling
        let card = library.popLast()!
        card.revealToOwner()
        hand.append(card)
        if !noTrigger {
            triggerAbilities(.YouDrawCard)
            numberCardsDrawnThisTurn += 1
            if (numberCardsDrawnThisTurn == 2) {
                triggerAbilities(.YouDrawSecondCard)
            }
            eachOpponent({ $0.triggerAbilities(.OpponentDrawsCard) })
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
    
    func exileTopOfLibrary(_ amt: Int = 1) {
        for _ in 0..<amt {
            if let card = library.popLast() {
                card.reveal()
                exileObject(card)
            }
        }
    }
    
    func untapStep() {
        for permanent in permanents {
            if permanent.isTapped && permanent.untapsDuringNextUntapStep && permanent.untapsDuringUntapStep {
                permanent.untap()
            }
            permanent.untapsDuringNextUntapStep = true
        }
    }
    
    func givePriority() {
        
    }
    
    func triggerAbilities(_ trigger: Trigger, associatedObjects: AssociatedObjects = [:]) {
        triggerAbilities(trigger, exclusions: [], associatedObjects: associatedObjects)
    }
    func triggerAbilities(_ trigger: Trigger, exclusion: Object, associatedObjects: AssociatedObjects = [:]) {
        triggerAbilities(trigger, exclusions: [exclusion], associatedObjects: associatedObjects)
    }
    func triggerAbilities(_ trigger: Trigger, exclusions: [Object], associatedObjects: AssociatedObjects = [:]) {
        permanents.filter({ permanent in !exclusions.contains(where: { $0 == permanent }) })
                  .forEach({ $0.triggerAbilities(trigger, associatedObjects: associatedObjects) })
        graveyard.filter({ card in !exclusions.contains(where: { $0 == card }) })
            .forEach({ $0.triggerAbilities(trigger, associatedObjects: associatedObjects, inGraveyard: true) })
        Game.shared.commandZone.filter({ object in object.getController() === self && !exclusions.contains(where: {$0 == object}) })
                               .forEach({ $0.triggerAbilities(trigger, associatedObjects: associatedObjects) })
    }
    
    
    func declareAttackers() {
        for permanent in getAttackers() {
            if permanent.isType(.Creature) {
                attackedWithCreatureThisTurn = true
            }
            permanent.triggerAbilities(.ThisAttacks)
            if permanent.isType(.Creature) && permanent.flying {
                Game.shared.bothPlayers({ $0.triggerAbilities(.CreatureWithFlyingAttacks) })
            }
            if permanent.isColor(.White) && permanent.isType(.Creature) {
                triggerAbilities(.WhiteCreatureYouControlAttacks)
            }
            if !permanent.vigilance {
                permanent.tap(declaredAsAttacker: true)
            }
        }
        if getAttackers().count == 1 {
            triggerAbilities(.CreatureYouControlAttacksAlone, associatedObjects: [CreatureYouControlAttacksAlone_Creature: getAttackers()])
        }
    }
    
    func declareBlockers() {
        for permanent in permanents {
            if permanent.blocking {
                permanent.triggerAbilities(.ThisBlocks)
            }
        }
        eachOpponent({ opponent in
            opponent.getPermanents().forEach({ permanent in
                if permanent.blocked {
                    permanent.triggerAbilities(.ThisBecomesBlocked)
                }
            })
        })
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
    
    func castTriggers(card: Card) {
        if card.isSpell() {
            triggerAbilities(.YouCastSpell)
            numberSpellsCastThisTurn += 1
            if numberSpellsCastThisTurn == 1 && !card.getController().active {
                triggerAbilities(.YouCastFirstSpellEachOpponentsTurn)
            }
            if numberSpellsCastThisTurn == 2 {
                triggerAbilities(.YouCastYourSecondSpellEachTurn)
            }
        }
        if card.isSpell() && !card.getController().active {
            triggerAbilities(.YouCastSpellDuringOpponentsTurn)
        }
        if card.isSpell() && card.isType(.Legendary) {
            triggerAbilities(.YouCastLegendarySpell)
        }
        if card.isSpell() && (card.isType(.Instant) || card.isType(.Sorcery)) {
            numberInstantsOrSorceriesCastThisTurn += 1
            triggerAbilities(.YouCastInstantOrSorcery)
            getOpponent().triggerAbilities(.OpponentCastsInstantOrSorcery)
            Game.shared.bothPlayers({ $0.triggerAbilities(.APlayerCastsInstantOrSorcery) })
            if card.isType(.Instant) {
                triggerAbilities(.YouCastInstantSpell)
            }
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
        
        if card.isSpell() && card.isType(.Knight) {
            triggerAbilities(.YouCastKnightSpell)
        }
        if card.isSpell() && card.isType(.Merfolk) {
            triggerAbilities(.YouCastMerfolkSpell)
        }
        if card.isSpell() && card.isHistoric() {
            triggerAbilities(.YouCastHistoricSpell)
        }
        
        if card.isSpell() && card.isColor(.Blue) {
            triggerAbilities(.YouCastBlueSpell)
        }
        if card.isSpell() && card.isColor(.Red) {
            triggerAbilities(.YouCastRedSpell)
        }
        if card.isSpell() && card.isMulticolored() {
            triggerAbilities(.YouCastMulticoloredSpell)
        }
        
        if card.getConvertedManaCost() >= 5 {
            triggerAbilities(.YouCastSpellCMCFiveOrGreater)
        }
    }
    
    func finishTargeting(_ card: Card) {
        Game.shared.castingSpell = nil
        Game.shared.checkStateBasedActions()
        castTriggers(card: card)
    }
    
    func finishCastingSpell(_ card: Card) {
        manaPool.payFor(card)
        if card.requiresTargets() {
            Game.shared.targetingEffects.append(card.spellAbility as! TargetedEffect)
        } else {
            finishTargeting(card)
        }
    }
    
    func castSpell(_ card: Card) {
        removeObjectFromCurrentZone(card)
        Game.shared.theStack.push(card)
        Game.shared.castingSpell = card
        // TODO: player.canAfford insteadof manaPool.canAfford (for non-mana costs)
        if manaPool.canAfford(card) {
            finishCastingSpell(card)
        }
    }
    
    func play(card:Card) {
        if card.usesStack() {
            castSpell(card)
        }
        else {
            assert(card.getConvertedManaCost() == 0)
            addPermanent(card)
            if card.isType(.Land) {
                Game.shared.setLandPlayedThisTurn()
            }
            card.reveal()
            Game.shared.checkStateBasedActions()
        }
        card.reveal()
    }
    
    func resolve(object: Object) {
        object.resolve()
        if object.isPermanent() {
            addPermanent(object)
        }
        else if object as? Card != nil {
            graveyard.append(object as! Card)
        }
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
        // TODO: new object when changing zones
        object.disassociateWithExiler()
        object.removeDamage()
        object.untap()
        // TODO: Use getZone?
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
        else if Game.shared.theStack.contains(object) {
            Game.shared.theStack.remove(object)
        }
        // TODO: Command zone? assert?
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
            triggerAbilities(.AnotherCreatureEntersBattlefieldUnderYourControl, exclusion: object)
        }
        if object.isType(.Dragon) {
            triggerAbilities(.DragonEntersBattlefieldUnderYourControl)
        }
        if object.isType(.Enchantment) {
            triggerAbilities(.EnchantmentEntersBattlefieldUnderYourControl)
        }
        if object.isType(.Gate) {
            triggerAbilities(.GateEntersBattlefieldUnderYourControl)
        }
        if object.isType(.Knight) {
            triggerAbilities(.KnightEntersBattlefieldUnderYourControl)
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
    func putIntoGraveyard(_ object: Object) {
        removeObjectFromCurrentZone(object)
        object.reveal()
        object.getOwner().graveyard.append(object)
    }
    
    func counter(_ object: Object) {
        putIntoGraveyard(object)
    }
    
    func discard(_ amount: Int = 1) {
        cardsToDiscard += min(hand.count, amount)
    }
    
    func discardCard(_ object: Object) {
        putIntoGraveyard(object)
    }
    
    func discardHand() {
        for object in hand {
            discardCard(object)
        }
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
        // TODO, if creature that would cause trigger dies at same time, still triggers
        if object.isType(.Creature) {
            triggerAbilities(.CreatureYouControlDies)
            triggerAbilities(.AnotherCreatureYouControlDies, exclusion: object)
            if !object.isToken() {
                // TODO, if multiple things die at same tame, all should trigger multiple times
                object.triggerAbilities(.NontokenCreatureYouControlDies)
                triggerAbilities(.NontokenCreatureYouControlDies)
            }
        }
        if object.isType(.Creature) || object.isType(.Planeswalker) {
            triggerAbilities(.AnotherCreatureOrPlaneswalkerYouControlDies, exclusion: object)
        }
        if object.isType(.Land) {
            Game.shared.bothPlayers({
                $0.triggerAbilities(.LandPutIntoAGraveyardFromPlay, associatedObjects: [LandPutIntoGraveyardFromPlay_Land: [object]])
            })
        }
    }
    
    func exileObject(_ object: Object, faceDown: Bool = false) {
        let oldZone = object.getZone()
        removeObjectFromCurrentZone(object)
        if !faceDown {
            object.reveal()
        }
        Game.shared.exile.append(object)
        if oldZone == .Battlefield {
            object.triggerAbilities(.ThisExiledFromBattlefield)
        }
    }
    func exileGraveyard() {
        graveyard.forEach({ exileObject($0) })
    }
    
    func revealHandTo(_ player: Player) {
        getHand().forEach({ $0.revealTo(player) })
    }
    func revealHand() {
        Game.shared.bothPlayers({ revealHandTo($0) })
    }
    
    func putOnTopOfLibrary(_ object: Object, fromTop: Int = 1) {
        removeObjectFromCurrentZone(object)
        let index = max(0, getLibrary().count - (fromTop - 1))
        library.insert(object, at: index)
    }
    
    func putOnBottomOfLibrary(_ objects: inout [Object], random: Bool) {
        if random {
            objects.forEach({ $0.hide() })
            objects.shuffle()
        }
        for object in objects {
            putOnBottomOfLibrary(object)
        }
    }
    func putOnBottomOfLibrary(_ object: Object) {
        removeObjectFromCurrentZone(object)
        library.insert(object, at: 0)
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

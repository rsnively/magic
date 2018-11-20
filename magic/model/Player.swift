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
        permanents.forEach({$0.setOwner(owner: self)})
        
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
        getPermanents().forEach({ $0.triggerAbilities(.YouGainLife) })
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
        return permanents.filter { $0.attacking }
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
    }
    
    func payFor(_ cost: Cost, _ source: Object) {
        manaPool.payFor(cost.getManaCost())
        if cost.getTapCost() {
            source.tap()
        }
        if cost.getSacrificeSelf() {
            source.sacrifice()
        }
        loseLife(cost.getLifeCost())
    }
    
    func pregameActions() {
        library.shuffle()
        drawCards(7)
    }
    
    func drawCard() {
        // todo, milling
        hand.append(library.popLast()!)
        getPermanents().forEach({ $0.triggerAbilities(.YouDrawCard)} );
    }
    
    func drawCards(_ amt: Int) {
        for _ in 0..<amt {
            drawCard()
        }
    }
    
    func mill(_ amt: Int) {
        for _ in 0..<amt {
            if let card = library.popLast() {
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
    
    func declareAttackers() {
        for permanent in permanents {
            if permanent.attacking {
                permanent.triggerAbilities(.ThisAttacks)
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
            if permanent.attacking {
                if permanent.blocked {
                    //todo order blockers / double blocks
                    if let blocker = permanent.blockers.first {
                        
                        if (firstStrike && (permanent.firstStrike || permanent.doubleStrike)) || (!firstStrike && (!permanent.firstStrike || permanent.doubleStrike)) {
                            if permanent.trample {
                                let damageToBlocker = min(permanent.getPower(), blocker.getToughness())
                                let damageToPlayer = permanent.getPower() - damageToBlocker
                                permanent.damage(to: blocker, damageToBlocker)
                                permanent.damage(to: permanent.getOpponent(), damageToPlayer, combatDamage: true)
                            } else {
                                permanent.damage(to: blocker, permanent.getPower())
                            }
                        }
                        if (firstStrike && (blocker.firstStrike || blocker.doubleStrike)) || (!firstStrike && (!blocker.firstStrike || blocker.doubleStrike)) {
                            blocker.damage(to: permanent, blocker.getPower())
                        }
                    }
                } else {
                    permanent.damage(to: permanent.getOpponent(), permanent.getPower(), combatDamage: true)
                }
            }
        }
    }
    
    func removeCreaturesFromCombat() {
        permanents.forEach({ $0.removeFromCombat() })
    }
    
    func play(card:Card) {
        let cardIndex = hand.firstIndex(where: {$0.id == card.id})!
        // TODO: Card's manaCost should be cost, and then we can use player.canAfford here
        if manaPool.canAfford(card) {
            hand.remove(at:cardIndex)
            manaPool.payFor(card)
            if (card.requiresTargets()) {
                Game.shared.targetingEffects.append(card.effects.first(where: { return $0.requiresTarget() })! as! TargetedEffect)
            }
            if card.usesStack() {
                Game.shared.theStack.push(card)
            }
            else {
                addPermanent(card)
                Game.shared.checkStateBasedActions()
            }
            
            if card.isSpell() && (card.isType(.Instant) || card.isType(.Sorcery)) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastInstantOrSorcery) })
            }
            if card.isSpell() && card.isType(.Creature) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastCreatureSpell) })
            }
            if card.isSpell() && !card.isType(.Creature) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastNoncreatureSpell) })
            }
            if card.isSpell() && card.isType(.Enchantment) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastEnchantmentSpell) })
            }
            
            if card.isSpell() && card.isHistoric() {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastHistoricSpell) })
            }
            
            if card.isSpell() && card.isColor(.Blue) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastBlueSpell) })
            }
            if card.isSpell() && card.colors.count > 1 {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastMulticoloredSpell) })
            }
        }
        else {
            return
        }
        
        if (card.isType(Type.Land)) {
            Game.shared.setLandPlayedThisTurn()
        }
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
    
    func addPermanent(_ object: Object) {
        permanents.append(object)
        if object.entersTapped {
            object.setTapped(true)
        }
        object.turnEnteredBattlefield = Game.shared.getCurrentTurn()
        object.replaceEvent(.ThisETB)
        object.triggerAbilities(.ThisETB)
        if object.isType(.Land) {
            getPermanents().forEach({ $0.triggerAbilities(.Landfall) })
        }
    }
    
    func bouncePermanent(_ object: Object) {
        let index = permanents.firstIndex(where: {$0.id == object.id})!
        permanents.remove(at: index)
        object.getOwner().hand.append(object)
    }
    
    func discard(_ amount: Int = 1) {
        cardsToDiscard += min(hand.count, amount)
    }
    
    func discardCard(_ object: Object) {
        let index = hand.firstIndex(where: {$0.id == object.id})!
        hand.remove(at: index)
        graveyard.append(object)
    }
    
    func chooseCardToDiscard(_ object: Object) {
        discardCard(object)
        cardsToDiscard -= 1
    }
    
    func destroyPermanent(_ object: Object) {
        let index = permanents.firstIndex(where: {$0.id == object.id})!
        permanents.remove(at: index)
        object.getOwner().graveyard.append(object)
        object.triggerAbilities(.ThisDies)
    }
}

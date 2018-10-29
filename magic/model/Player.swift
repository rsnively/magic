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
    
    init(deck: [Card]) {
        self.library = deck
        super.init()
        library.forEach({ $0.setOwner(owner: self) })
        for card in library {
            card.setOwner(owner: self)
        }
        
//        for _ in 0..<4 {
//            permanents.append(GRN.Forest())
//        }
//        permanents.forEach({$0.setOwner(owner: self)})
        
        self.pregameActions()
    }
    
    func getOpponent() -> Player {
        return Game.shared.getOtherPlayer(self)
    }
    
    func getLife() -> Int {
        return life
    }
    
    override func takeDamage(_ amount: Int) {
        self.loseLife(amount)
    }
    
    func loseLife(_ amount: Int) {
        life -= amount
    }
    
    func gainLife(_ amount: Int) {
        life += amount
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
    
    func payFor(_ cost: Cost, _ source: Object) {
        manaPool.payFor(cost.getManaCost())
        if cost.getTapCost() {
            source.tap()
        }
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
        // Something will happen here maybe
    }
    
    func dealCombatDamage() {
        for permanent in permanents {
            if permanent.attacking {
                if permanent.blocked {
                    //todo order blockers / double blocks
                    if let blocker = permanent.blockers.first {
                        permanent.damage(to: blocker, max(permanent.getPower(), 0))
                        blocker.damage(to: permanent, max(blocker.getPower(), 0))
                    }
                } else {
                    permanent.damage(to: Game.shared.getNonActivePlayer(), max(permanent.getPower(), 0))
                }
            }
        }
    }
    
    func removeCreaturesFromCombat() {
        for permanent in permanents {
            permanent.attacking = false
            permanent.blocking = false
            permanent.blockers.removeAll()
            permanent.attackers.removeAll()
            permanent.blocked = false
        }
    }
    
    func play(card:Card) {        
        let cardIndex = hand.firstIndex(where: {$0.id == card.id})!
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
                if card.entersTapped {
                    card.setTapped(true)
                }
                addPermanent(card)
            }
            
            if card.isSpell() && (card.isType(.Instant) || card.isType(.Sorcery)) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastInstantOrSorcery) })
            }
            if card.isSpell() && card.isType(.Creature) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastCreatureSpell) })
            }
            if card.isSpell() && card.isType(.Enchantment) {
                getPermanents().forEach({ $0.triggerAbilities(.YouCastEnchantmentSpell) })
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
            if object.entersTapped {
                object.setTapped(true)
            }
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
        object.turnEnteredBattlefield = Game.shared.getCurrentTurn()
        object.triggerAbilities(.ThisETB)
    }
    
    func bouncePermanent(_ object: Object) {
        let index = permanents.firstIndex(where: {$0.id == object.id})!
        permanents.remove(at: index)
        object.getOwner().hand.append(object)
    }
    
    func discard(_ object: Object) {
        let index = hand.firstIndex(where: {$0.id == object.id})!
        hand.remove(at: index)
        graveyard.append(object)
    }
    
    func destroyPermanent(_ object: Object) {
        let index = permanents.firstIndex(where: {$0.id == object.id})!
        permanents.remove(at: index)
        object.getOwner().graveyard.append(object)
        object.triggerAbilities(.ThisDies)
    }
}

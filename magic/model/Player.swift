import Foundation

class Player: NSObject {
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
//            permanents.append(GRN.Plains())
//            permanents.append(GRN.Swamp())
//        }
//        permanents.forEach({$0.setOwner(owner: self)})
        
        self.pregameActions()
    }
    
    func getLife() -> Int {
        return life
    }
    
    func damage(_ amount: Int) {
        self.loseLife(amount)
    }
    
    func loseLife(_ amount: Int) {
        life -= amount
    }
    
    func gainLife(_ amount: Int) {
        life += amount
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
    
    func addMana(color: Color?) {
        manaPool.add(Mana(color))
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
    }
    
    func drawCards(_ amt: Int) {
        for _ in 0..<amt {
            drawCard()
        }
    }
    
    func untapAllPermanents() {
        for permanent in permanents {
            if permanent.isTapped {
                permanent.untap()
            }
        }
    }
    
    func declareAttackers() {
        for permanent in permanents {
            if permanent.attacking && !permanent.vigilance {
                permanent.triggerAbilities(.ThisAttacks)
                permanent.tap()
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
                        permanent.dealsDamage()
                        blocker.dealsDamage()
                        permanent.dealDamage(max(blocker.getPower(), 0))
                        blocker.dealDamage(max(permanent.getPower(), 0))
                    }
                } else {
                    permanent.dealsDamage()
                    Game.shared.getNonActivePlayer().damage(max(permanent.getPower(), 0))
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
        let cardIndex = hand.index(of: card)!
        if manaPool.canAfford(card) {
            hand.remove(at:cardIndex)
            manaPool.payFor(card)
            if (card.requiresTargets()) {
                Game.shared.targetingEffect = (card.effects.first(where: { return $0.requiresTarget() && ($0 as! TargetedEffect).target == nil })! as! TargetedEffect)
            }
            if card.usesStack() {
                Game.shared.theStack.push(card)
            }
            else {
                addPermanent(card)
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
        object.turnEnteredBattlefield = Game.shared.getCurrentTurn()
        object.triggerAbilities(.ThisETB)
    }
    
    func bouncePermanent(_ object: Object) {
        let index = permanents.index(of: object as! Card)!
        permanents.remove(at: index)
        (object as! Card).getOwner().hand.append(object as! Card)
    }
    
    func discard(_ object: Object) {
        let index = hand.index(of: object)!
        hand.remove(at: index)
        graveyard.append(object)
    }
    
    func destroyPermanent(_ object: Object) {
        let index = permanents.index(of: object)!
        permanents.remove(at: index)
        object.getOwner().graveyard.append(object)
        object.triggerAbilities(.ThisDies)
    }
}

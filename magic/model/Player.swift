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
        
        self.pregameActions()
        
        for _ in 0..<5 {
            permanents.append(M19.Plains())
            permanents.append(M19.Swamp())
        }
        permanents.forEach({ $0.setOwner(owner: self) })
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
    
    func getLands() -> [Object] {
        return permanents.filter { $0.isType(Type.Land) }
    }
    func getCreatures() -> [Object] {
        return permanents.filter { $0.isType(Type.Creature) }
    }
    func getArtifacts() -> [Object] {
        return permanents.filter { $0.isType(Type.Artifact) }
    }
    
    func addMana(color: Color?) {
        manaPool.add(Mana(color))
    }
    
    func getManaPool() -> ManaPool {
        return manaPool
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
                permanent.tap()
            }
        }
    }
    
    func dealCombatDamage() {
        for permanent in permanents {
            if permanent.attacking {
                permanent.dealsDamage()
                Game.shared.getNonActivePlayer().damage(permanent.getPower())
            }
        }
    }
    
    func removeCreaturesFromCombat() {
        for permanent in permanents {
            permanent.attacking = false
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
        permanents.append(token)
    }
    
    func addPermanent(_ object: Object) {
        permanents.append(object)
        object.triggerAbilities(.ThisETB)
    }
    
    func bouncePermanent(_ object: Object) {
        let index = permanents.index(of: object as! Card)!
        permanents.remove(at: index)
        (object as! Card).getOwner().hand.append(object as! Card)
    }
    
    func destroyPermanent(_ object: Object) {
        let index = permanents.index(of: object)!
        permanents.remove(at: index)
        object.getOwner().graveyard.append(object)
        object.triggerAbilities(.ThisDies)
    }
}

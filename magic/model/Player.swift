import Foundation

class Player: NSObject {
    private var life = 20
    private var library: [Card]
    private var hand: [Card] = []
    private var permanents: [Card] = []
    private var manaPool: ManaPool = ManaPool()

    var active = false
    var hasPriority = false
    
    init(deck: [Card]) {
        self.library = deck
        super.init()
        for card in library {
            card.setOwner(owner: self)
        }
        
        self.pregameActions()
    }
    
    func getHand() -> [Card] {
        return hand
    }
    
    func getLands() -> [Card] {
        return permanents.filter { $0.isType(Type.Land) }
    }
    func getCreatures() -> [Card] {
        return permanents.filter { $0.isType(Type.Creature) }
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
    
    func play(card:Card) {
        if !card.isType(Type.Instant) && (!Game.shared.theStack.isEmpty || !card.controller!.active || !Game.shared.getCurrentPhase().sorcerySpeed()) {
            return
        }
        if (card.isType(Type.Land) && Game.shared.landWasPlayedThisTurn()) {
            return
        }
        
        let cardIndex = hand.index(of: card)!
        hand.remove(at:cardIndex)
        if manaPool.canAfford(card) {
            manaPool.payFor(card)
            if card.usesStack() {
                Game.shared.theStack.push(card)
            }
            else {
                permanents.append(card)
            }
        }
        else {
            hand.append(card)
        }
        
        if (card.isType(Type.Land)) {
            Game.shared.setLandPlayedThisTurn()
        }
    }
    
    func resolve(object: Object) {
        if object.isPermanent() {
            permanents.append(object as! Card)
        }
    }
}

import Foundation

class Player: NSObject {
    private var life = 20
    private var library: [Card]
    private var hand: [Card] = []
    private var permanents: [Card] = []
    private var manaPool: ManaPool = ManaPool()
    
    init(deck: [Card]) {
        self.library = deck
        super.init()
        
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
    
    func play(card:Card) {
        if (!Game.shared.theStack.isEmpty && !card.isType(Type.Instant)) {
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
    }
    
    func resolve(object: Object) {
        if object.isPermanent() {
            permanents.append(object as! Card)
        }
    }
}

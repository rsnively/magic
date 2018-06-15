import Foundation

class Player: NSObject {
    private var life = 20
    var hand: [Card] = []
    private var permanents: [Card] = []
    private var manaPool: ManaPool = ManaPool()
    
    override init() {
        super.init()
        
        hand.append(M19.Plains(owner: self))
        hand.append(M19.Plains(owner: self))
        hand.append(KLD.Forest(owner: self))
        hand.append(KLD.Forest(owner: self))
        hand.append(KLD.Forest(owner: self))
        hand.append(M19.OreskosSwiftclaw(owner: self))
        hand.append(KLD.TerrainElemental(owner: self))
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

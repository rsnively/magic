import Foundation

class Game: NSObject {
    var player1:Player
    var player2:Player
    var theStack:SpellStack
    
    static let shared = Game()
    
    override private init() {
        var deck1: [Card] = []
        var deck2: [Card] = []
        for _ in 0..<15 {
            deck1.append(KLD.Forest())
            deck1.append(KLD.Forest())
            deck1.append(M19.CentaurCourser())
            deck1.append(M19.Gigantosaurus())
            
            deck2.append(M19.Plains())
            deck2.append(M19.OreskosSwiftclaw())
            deck2.append(M19.FieldCreeper())
            deck2.append(M19.LoxodonLineBreaker())
        }
        
        player1 = Player(deck: deck1)
        player2 = Player(deck: deck2)
        theStack = SpellStack()
        super.init()
    }
    
    func advanceGame() {
        if !theStack.isEmpty {
            theStack.resolveTop()
        }
    }
}

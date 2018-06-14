import Foundation

class Game: NSObject {
    var player1:Player
    var player2:Player
    var theStack:SpellStack
    
    static let shared = Game()
    
    override private init() {
        player1 = Player()
        player2 = Player()
        theStack = SpellStack()
        super.init()
    }
}

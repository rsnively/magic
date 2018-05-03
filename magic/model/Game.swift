import Foundation

class Game: NSObject {
    var player1:Player
    var player2:Player
    
    override init() {
        player1 = Player()
        player2 = Player()
        super.init()
    }
}

import Foundation

class Opponent {
    static let shared = Opponent()
    
    func givePriority() {
        print("Hmmm... no effects")
        Game.shared.advanceGame()
    }
    
    func declareAttackers() {
        print("Hmmm... no attacks")
        Game.shared.advanceGame()
    }
}

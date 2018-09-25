import Foundation

class Opponent {
    unowned var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func givePriority() {
        print("Play land if able")
        if !Game.shared.landWasPlayedThisTurn() && Game.shared.getCurrentPhase().sorcerySpeed() {
            let land = player.getHand().first(where: { $0.isType(.Land) })
            if let land = land {
                print("Playing land: ", land.getName())
                player.play(card: (land as! Card))
            }
        }
        
        Game.shared.advanceGame()
    }
    
    func declareAttackers() {
        print("Hmmm... no attacks")
        Game.shared.advanceGame()
    }
}

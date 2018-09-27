import Foundation

class Opponent {
    unowned var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func givePriority() {
        let land = player.getHand().first(where: { $0.isType(.Land) })
        if let land = land {
            if (land as! Card).canPlay() {
                player.play(card: (land as! Card))
            }
        }
        if Game.shared.getCurrentPhase() == .SecondMain {
            player.getHand().filter({!$0.isType(.Land)}).forEach({ card in
                let availableMana = player.getLands().count
                if availableMana >= card.getConvertedManaCost() {
                    var paid = 0
                    player.getLands().filter({!$0.isTapped}).forEach({ land in
                        if paid < card.getConvertedManaCost() {
                            land.tap()
                            player.addMana(color: getColorForLandType(subtype: land.subtypes.first!))
                            paid += 1
                        }
                    })
                    player.play(card: card as! Card)
                }
            })
        }
        
        Game.shared.advanceGame()
    }
    
    func declareAttackers() {
        player.getCreatures().filter({$0.canAttack()}).forEach({$0.attacking = true})
        Game.shared.advanceGame()
    }
}

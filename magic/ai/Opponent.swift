import Foundation

class Opponent {
    unowned var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func givePriority() {
        var actionTaken = false
        player.getHand().filter({($0 as! Card).canPlay()}).forEach({ card in
            let availableMana = player.getLands().count
            if card.isType(.Land) {
                if !Game.shared.landWasPlayedThisTurn() {
                    player.play(card: card as! Card)
                }
            }
            else if availableMana >= card.getConvertedManaCost() {
                var paid = 0
                player.getLands().filter({!$0.isTapped}).forEach({ land in
                    if paid < card.getConvertedManaCost() {
                        land.tap()
                        player.addMana(color: getColorForLandType(subtype: land.subtypes.first!))
                        paid += 1
                    }
                })
                player.play(card: card as! Card)
                actionTaken = true
            }
        })
        
        if actionTaken || player.active {
            Game.shared.passPriority()
        } else {
            Game.shared.advanceGame()
        }
    }
    
    func declareAttackers() {
        player.getCreatures().filter({$0.canAttack()}).forEach({$0.attacking = true})
        Game.shared.advanceGame()
    }
    
    func declareBlockers() {
        Game.shared.advanceGame()
    }
}

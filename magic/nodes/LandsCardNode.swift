import Foundation
import SpriteKit

class LandsCardNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if Game.shared.isTargeting {
                if Game.shared.targetingEffect!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    (self.scene as! GameScene).redraw()
                }
            }
            else if card.getController() == Game.shared.player1 && !card.isTapped {
                // todo: non-basic lands / should behave like activated abilities with some exceptions
                let manaType:Color? = getColorForLandType(subtype: self.card.subtypes.first!)
                self.card.tap()
                self.card.getOwner().addMana(color: manaType)
                (self.scene as! GameScene).redraw()
            }
        }
    }
}


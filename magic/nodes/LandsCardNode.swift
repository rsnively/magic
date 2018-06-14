import Foundation
import SpriteKit

class LandsCardNode: CardNode {
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        if self.touching {
            touchPoint = nil
            if !self.card.isTapped {
                // todo: non-basic lands / should behave like activated abilities with some exceptions
                let manaType:Color? = getColorForLandType(subtype: self.card.subtypes.first!)
                self.card.tap()
                self.card.getOwner().addMana(color: manaType)
                (self.scene as! GameScene).redraw()
            }
        }
    }
}


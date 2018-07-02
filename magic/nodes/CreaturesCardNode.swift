import Foundation
import SpriteKit

class CreaturesCardNode: CardNode {
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
            (self.scene as! GameScene).expandedCard = self.card
        } else if card.canAttack() {
            card.attacking = !card.attacking
            (self.scene as! GameScene).redraw()
        }
    }
}

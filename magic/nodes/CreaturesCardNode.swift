import Foundation
import SpriteKit

class CreaturesCardNode: CardNode {
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        (self.scene as! GameScene).expandedCard = self.card
    }
}

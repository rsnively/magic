import Foundation
import SpriteKit

class HandCardNode: CardNode {
    private var moved:Bool = false
    private var startingPosition = CGPoint.zero
    
    override func touchDown(atPoint pos: CGPoint) {
        if self.hasActions() {
            return
        }
        touchPoint = convert(pos, from:parent!)
        moved = false
        startingPosition = position
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
        if self.card.ownedByHuman() {
            position = pos - touchPoint!
        }
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if self.card.getOwner().isDiscarding {
                self.card.getOwner().chooseCardToDiscard(self.card)
            } else {
                (self.scene as! GameScene).expandedCard = self.card
            }
        } else if self.card.ownedByHuman() && pos.y > (self.scene as! GameScene).playCardHeight && (card as! Card).canPlay() {
            self.card.getOwner().play(card: (self.card as! Card))
        } else {
            let moveAction = SKAction.move(to: startingPosition, duration: 0.5)
            moveAction.timingMode = .easeOut
            run(moveAction)
        }
    }
}

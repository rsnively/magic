import Foundation
import SpriteKit

class GraveyardCardNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos: CGPoint) {
        if touching {
            touchPoint = nil
            if !moved {
                if Game.shared.isTargeting {
                    if Game.shared.targetingEffects.last!.meetsRestrictions(target: card) {
                        Game.shared.selectTarget(card)
                        return
                    }
                }
            }
        }
    }
}

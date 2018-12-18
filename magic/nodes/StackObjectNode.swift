import Foundation
import SpriteKit

class StackObjectNode: CardNode {
    private unowned var object: Object
    
    init(object: Object, allowedSize: CGSize) {
        self.object = object
        if let card = object as? Card {
            super.init(card: card, allowedSize: allowedSize)
        } else if let triggeredAbility = object as? TriggeredAbility {
            super.init(card: triggeredAbility.getSource(), allowedSize: allowedSize)
        } else {
            super.init(card: (object as! ActivatedAbility).getSource(), allowedSize: allowedSize)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                    if Game.shared.targetingEffects.last!.meetsRestrictions(target: object) {
                        Game.shared.selectTarget(object)
                        return
                    }
                }
            }
        }
    }
}

import Foundation
import SpriteKit

class StackObjectNode: CardNode {
    init(object: Object, allowedSize: CGSize) {
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
}

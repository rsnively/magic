import Foundation
import SpriteKit

class StackObjectNode: CardNode {
    init(object: Object, allowedSize: CGSize) {
        if let card = object as? Card {
            super.init(card: card, allowedSize: allowedSize)
        } else {
            // triggered ability - use card image for now
            super.init(card: (object as! TriggeredAbility).getSource(), allowedSize: allowedSize)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

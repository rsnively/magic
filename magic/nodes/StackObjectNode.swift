import Foundation
import SpriteKit

class StackObjectNode: CardNode {
    init(object: Object, allowedSize: CGSize) {
        super.init(card: object as! Card, allowedSize: allowedSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

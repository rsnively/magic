import Foundation
import SpriteKit

class CardNode: SKNode {
    
    override init() {
        super.init()
        addChild(SKSpriteNode(color: UIColor.green, size:CGSize(width:100, height:100)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

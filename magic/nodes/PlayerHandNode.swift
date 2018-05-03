import Foundation
import SpriteKit

class PlayerHandNode: SKNode {
    
    override init() {
        super.init()
        addChild(CardNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

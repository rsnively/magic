import Foundation
import SpriteKit

class LifeNode: SKNode {
    
    func setLife(life: Int, size: CGSize) {
        removeAllChildren()
        
        let backgroundNode = SKShapeNode.init(circleOfRadius: min(size.width, size.height) / 2.0)
        backgroundNode.fillColor = SKColor.green
        addChild(backgroundNode)
        
        let labelNode = SKLabelNode.init(text: String(life))
        labelNode.fontName = "HelveticaNeue"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 12
        addChild(labelNode)
    }
    
    init(life: Int, size: CGSize) {
        super.init()
        setLife(life: life, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

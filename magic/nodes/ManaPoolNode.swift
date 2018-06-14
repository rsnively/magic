import Foundation
import SpriteKit

class ManaPoolNode: SKNode {
    
    private static func getLetterNode(color: Color?) -> SKLabelNode {
        let node = SKLabelNode(text:color == nil ? "1" : String(color!.rawValue))
        node.fontName = "HelveticaNeue"
        node.fontColor = UIColor.black
        node.fontSize = 12
        return node
    }
    
    func setManaPool(manaPool: ManaPool, size: CGSize) {
        removeAllChildren()
        for i in 0 ..< manaPool.count {
            let letterNode = ManaPoolNode.getLetterNode(color: manaPool.at(i)!.getColor())
            letterNode.position.x = ((CGFloat(i) - CGFloat(manaPool.count)) / 2.0 + 0.5) * 15.0
            addChild(letterNode)
        }
    }
}

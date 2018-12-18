import Foundation
import SpriteKit

class StackNode: SKNode {
    var backgroundNode: SKSpriteNode?
    var objectNodes: [StackObjectNode] = []
    
    private let borderMarginPercent: CGFloat = 1.25
    
    func setStack(stack: SpellStack, size: CGSize) {
        removeAllChildren()
        objectNodes.removeAll()
        for i in 0..<stack.count {
            let objectNode = StackObjectNode(object: stack.asArray[i], allowedSize:CGSize(width:size.width, height:size.height))
            objectNode.position.x = ((CGFloat(i) - CGFloat(stack.count)) / 2.0 + 0.5) * objectNode.size.width * 0.8
            objectNode.zPosition = CGFloat(i) / CGFloat(stack.count)
            objectNodes.append(objectNode)
            addChild(objectNode)
        }
        
        if !stack.isEmpty {
            let cardSize = (children[0] as! StackObjectNode).size
            let backgroundSize = CGSize(width: cardSize.width * (CGFloat(stack.count) * 0.8 + 0.2), height: cardSize.height) * 1.25
            
            backgroundNode = SKSpriteNode(color: SKColor.clear, size: backgroundSize)
            addChild(backgroundNode!)
            
            let borderNode = SKShapeNode(rectOf: backgroundSize, cornerRadius: 3.0)
            borderNode.strokeColor = UIColor.red
            addChild(borderNode)
            
            let labelNode = SKLabelNode(text: "The Stack")
            labelNode.fontName = "HelveticaNeue"
            labelNode.fontColor = UIColor.red
            labelNode.fontSize = 12
            labelNode.position.y = size.height * 0.53
            addChild(labelNode)
        }
    }
    
    public var touchPoint:CGPoint? = nil
    var touching:Bool {
        return self.touchPoint != nil
    }
    
    func touchDown(atPoint pos: CGPoint) {
        for objectNode in objectNodes.reversed() {
            if objectNode.contains(pos) {
                objectNode.touchDown(atPoint: pos)
            }
        }
        if let backgroundNode = backgroundNode {
            if backgroundNode.contains(pos) {
                touchPoint = pos
            }
        }
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        for objectNode in objectNodes.reversed() {
            if objectNode.touching {
                objectNode.touchMoved(toPoint: pos)
            }
        }
        if touching {
            position = convert(pos - touchPoint!, to:self.parent!)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        for objectNode in objectNodes.reversed() {
            if objectNode.contains(pos) || objectNode.touching {
                objectNode.touchUp(atPoint: pos)
            }
        }
        if touching {
            touchPoint = nil
        }
    }
}

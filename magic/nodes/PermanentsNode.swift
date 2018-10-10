import Foundation
import SpriteKit

class PermanentsNode: SKNode {
    
    var permanentNodes: [PermanentNode] = []
    
    func setPermanents(permanents: [Object], size: CGSize) {
        removeAllChildren()
        permanentNodes.removeAll()
        let cardSize = CGSize(width:size.width * 0.35, height:size.height)
        for permanent in permanents {
            permanentNodes.append(PermanentNode(card: permanent, allowedSize:cardSize))
        }
        for i in 0 ..< permanentNodes.count {
            permanentNodes[i].position.x = (CGFloat(i) - CGFloat(permanentNodes.count) / 2.0 + 0.5) * permanentNodes[i].size.width * 1.5
            permanentNodes[i].zPosition = CGFloat(i) / CGFloat(permanentNodes.count)
            addChild(permanentNodes[i])
            if permanentNodes[i].card.isTapped {
                permanentNodes[i].zRotation = -CGFloat.pi / 2.0
            }
        }
    }
    
    init(permanents: [Object], size: CGSize) {
        super.init()
        setPermanents(permanents: permanents, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos:CGPoint) {
        for permanentNode in permanentNodes {
            if permanentNode.contains(pos) {
                permanentNode.touchDown(atPoint:pos)
                break
            }
        }
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        for permanentNode in permanentNodes {
            if permanentNode.touching {
                permanentNode.touchMoved(toPoint:pos)
                break
            }
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        for permanentNode in permanentNodes {
            if permanentNode.touching {
                permanentNode.touchUp(atPoint:pos)
                break
            }
        }
    }
}

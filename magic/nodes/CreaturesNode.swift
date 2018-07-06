import Foundation
import SpriteKit

class CreaturesNode: SKNode {
    var cardNodes:[CreaturesCardNode] = []
    
    func setCreatures(creatures: [Card], size: CGSize) {
        removeAllChildren()
        cardNodes.removeAll()
        let cardSize = CGSize(width:size.width * 0.4, height:size.height)
        for creature in creatures {
            cardNodes.append(CreaturesCardNode(card: creature, allowedSize:cardSize))
        }
        for i in 0 ..< cardNodes.count {
            cardNodes[i].position.x = (CGFloat(i) - CGFloat(cardNodes.count) / 2.0 + 0.5) * cardNodes[i].size.width * 1.5
            cardNodes[i].zPosition = CGFloat(i) / CGFloat(cardNodes.count)
            addChild(cardNodes[i])
            if cardNodes[i].card.isTapped {
                cardNodes[i].zRotation = -CGFloat.pi / 2.0
            }
        }
    }
    
    init(creatures:[Card], size:CGSize) {
        super.init()
        setCreatures(creatures: creatures, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos:CGPoint) {
        for cardNode in cardNodes {
            if cardNode.contains(pos) {
                cardNode.touchDown(atPoint:pos)
                break
            }
        }
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        for cardNode in cardNodes {
            if cardNode.touching {
                cardNode.touchMoved(toPoint:pos)
                break
            }
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        for cardNode in cardNodes {
            if cardNode.touching {
                cardNode.touchUp(atPoint:pos)
                break
            }
        }
    }
}

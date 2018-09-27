import Foundation
import SpriteKit

class LandsNode: SKNode {
    var cardNodes:[LandsCardNode] = []
    
    func setLands(lands: [Object], size: CGSize) {
        removeAllChildren()
        cardNodes.removeAll()
        let cardSize = CGSize(width:size.width * 0.35, height:size.height)
        for land in lands {
            cardNodes.append(LandsCardNode(card: land, allowedSize:cardSize))
        }
        _ = cardNodes.partition(by: { return !$0.card.isTapped })
        for i in 0 ..< cardNodes.count {
            cardNodes[i].position.x = ((CGFloat(i) - CGFloat(cardNodes.count)) / 2.0 + 0.5) * cardNodes[i].size.width * 0.2
            addChild(cardNodes[i])
            cardNodes[i].zPosition = CGFloat(i) / CGFloat(cardNodes.count)
            if cardNodes[i].card.isTapped {
                cardNodes[i].zRotation = -CGFloat.pi / 2.0
            }
        }
    }
    
    init(lands:[Card], size:CGSize) {
        super.init()
        setLands(lands: lands, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos:CGPoint) {
        for cardNode in cardNodes.reversed() {
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
        for cardNode in cardNodes.reversed() {
            if cardNode.touching {
                cardNode.touchUp(atPoint:pos)
                break
            }
        }
    }
}

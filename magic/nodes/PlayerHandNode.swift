import Foundation
import SpriteKit

class PlayerHandNode: SKNode {
    var cardNodes:[HandCardNode] = []
    private let rotateCards: Bool
    
    private let cardMargin:CGFloat = 3.0
    
    func setHand(cards: [Object], size: CGSize) {
        removeAllChildren()
        cardNodes.removeAll()
        let cardSize = CGSize(width:size.width * 0.35, height:size.height)
        for card in cards {
            cardNodes.append(HandCardNode(card:card, allowedSize:cardSize))
        }
        for i in 0 ..< cardNodes.count {
            cardNodes[i].position.x = (CGFloat(i)  - CGFloat(cardNodes.count) / 2.0 + 0.5) * (cardNodes[i].size.width + cardMargin)
            if rotateCards {
                cardNodes[i].zRotation = CGFloat.pi
            }
            addChild(cardNodes[i])
        }
    }
    
    init(hand:[Object], rotateCards: Bool, size:CGSize) {
        self.rotateCards = rotateCards
        super.init()
        setHand(cards: hand, size: size)
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

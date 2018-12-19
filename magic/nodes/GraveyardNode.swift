import Foundation
import SpriteKit

class GraveyardNode: SKNode {
    private var backgroundNode: SKShapeNode
    private var cardNodes: [GraveyardCardNode] = []
    private var isShowing: Bool = false
    
    func setGraveyard(graveyard: [Object], size: CGSize, cardsCenter: CGPoint) {
        self.removeAllChildren()
        cardNodes.removeAll()
        
        addChild(backgroundNode)
        
        let graveyardLabel = SKLabelNode.init(text: "GY")
        graveyardLabel.fontName = "HelveticaNeue"
        graveyardLabel.fontColor = UIColor.black
        graveyardLabel.fontSize = 14
        addChild(graveyardLabel)
        
        let graveyardCountLabel = SKLabelNode.init(text: String(graveyard.count))
        graveyardCountLabel.fontName = "HelveticaNeue"
        graveyardCountLabel.fontColor = UIColor.black
        graveyardCountLabel.fontSize = 14
        graveyardCountLabel.position.y = -14
        addChild(graveyardCountLabel)
        
        for card in graveyard {
            cardNodes.append(GraveyardCardNode(card: card, allowedSize: size * 10.0))
        }
        if isShowing {
            for i in 0 ..< cardNodes.count {
                let cardNode = cardNodes[i]
                cardNode.position.x = cardsCenter.x + (CGFloat(i) - CGFloat(cardNodes.count) / 2.0 + 0.1) * cardNode.size.width * 0.3
                cardNode.position.y = cardsCenter.y
                cardNode.zPosition = CGFloat(i) / CGFloat(cardNodes.count)
                addChild(cardNode)
            }
        }
    }
    
    init(size: CGSize, cardsCenter: CGPoint, graveyard: [Object]) {
        self.backgroundNode = SKShapeNode.init(rectOf: size)
        backgroundNode.fillColor = SKColor.gray
        
        super.init()
        setGraveyard(graveyard: graveyard, size: size, cardsCenter: cardsCenter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos:CGPoint) {
        if backgroundNode.contains(pos) {
            if !isShowing && !cardNodes.isEmpty {
                isShowing = true
            }
            else if isShowing {
                isShowing = false
            }
            return
        }
        if isShowing {
            for cardNode in cardNodes.reversed() {
                if cardNode.contains(pos) {
                    cardNode.touchDown(atPoint:pos)
                    break
                }
            }
        }
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        if isShowing {
            for cardNode in cardNodes {
                if cardNode.touching {
                    cardNode.touchMoved(toPoint:pos)
                    break
                }
            }
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        if isShowing {
            for cardNode in cardNodes.reversed() {
                if cardNode.contains(pos) || cardNode.touching {
                    cardNode.touchUp(atPoint:pos)
                }
            }
        }
    }
}

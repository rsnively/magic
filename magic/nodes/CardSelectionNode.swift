import Foundation
import SpriteKit

class CardSelectionNode: SKNode {
    private var cardNodes: [CardNode] = []
    private var restrictions: [(Object) -> Bool]
    private var currentRestriction: Int {
        get { return Game.shared.selectedCards.count }
    }
    
    private var leftScrollNode: SKShapeNode
    private var rightScrollNode: SKShapeNode
    private var scrollAmount: CGFloat = 0.0
    
    init(cardSize: CGSize, cards: [Object], restrictions: [(Object) -> Bool]) {
        for card in cards {
            cardNodes.append(CardNode(card: card, allowedSize: cardSize))
        }
        self.restrictions = restrictions
        
        self.leftScrollNode = SKShapeNode(rectOf: CGSize(width: 100, height: 80))
        leftScrollNode.strokeColor = SKColor.black
        leftScrollNode.fillColor = SKColor.green
        
        self.rightScrollNode = SKShapeNode(rectOf: CGSize(width: 100, height: 80))
        rightScrollNode.strokeColor = SKColor.black
        rightScrollNode.fillColor = SKColor.green
        
        super.init()
        update(cardSize: cardSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(cardSize: CGSize) {
        removeAllChildren()
        
        for i in 0 ..< cardNodes.count {
            let cardNode = cardNodes[i]
            let card = cardNode.card
            
            if restrictions[currentRestriction](card) {
                let canSelectBorder = SKShapeNode(rectOf: cardNode.size * 1.1, cornerRadius: 3.0)
                canSelectBorder.strokeColor = SKColor.blue
                canSelectBorder.fillColor = SKColor.blue
                cardNode.addChild(canSelectBorder)
            }
            
            cardNode.position.x = (CGFloat(i) - CGFloat(cardNodes.count) / 2.0 + 0.1) * cardNode.size.width * 1.1 - scrollAmount
            cardNode.zPosition = CGFloat(i) / CGFloat(cardNodes.count)
            addChild(cardNode)
        }
        
        let screenWidth: CGFloat = self.scene == nil ? 0.0 : self.scene!.size.width
        leftScrollNode.position = CGPoint(x: screenWidth * -0.4, y: cardSize.height * -0.5)
        rightScrollNode.position = CGPoint(x: screenWidth * 0.4, y: cardSize.height * -0.5)

        addChild(leftScrollNode)
        addChild(rightScrollNode)
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if leftScrollNode.contains(pos) {
            scrollAmount -= 100.0
        }
        else if rightScrollNode.contains(pos) {
            scrollAmount += 100.0
        }
        
        // TODO: Should probably make sure touch begins in card...
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        // TODO: ... and doens't move
    }
    
    func touchUp(atPoint pos: CGPoint) {
        for cardNode in cardNodes {
            if cardNode.contains(pos) && restrictions[currentRestriction](cardNode.card) {
                Game.shared.selectCard(cardNode.card)
                return
            }
        }
    }
}

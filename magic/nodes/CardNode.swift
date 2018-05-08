import Foundation
import SpriteKit

class CardNode: SKNode {
    var size:CGSize
    var card:Card
    
    private static let cardAspectRatio:CGFloat = 0.714
    private static func getMaximumCardSize(for size:CGSize) -> CGSize {
        return size.width > size.height * cardAspectRatio
            ? CGSize(width:size.height * cardAspectRatio, height:size.height)
            : CGSize(width:size.width, height:size.width / cardAspectRatio)
    }
    
    private static func getBackgroundNode(card:Card, cardSize:CGSize) -> SKSpriteNode {
        return SKSpriteNode(color:getUIColor(for:card.colors), size:cardSize)
    }
    
    private static func getNameNode(card:Card, cardSize:CGSize) -> SKLabelNode {
        let node = SKLabelNode(text:card.name)
        node.fontName = "HelveticaNeue-Regular"
        node.fontColor = UIColor.black
        node.fontSize = cardSize.height * 0.1
        node.position = CGPoint(x: (node.frame.width * 1.3 - cardSize.width) / 2.0, y: cardSize.height / 2.0 - node.frame.height)
        return node
    }
    
    init(card:Card, allowedSize:CGSize) {
        self.card = card
        size = CardNode.getMaximumCardSize(for: allowedSize)
        super.init()
        addChild(CardNode.getBackgroundNode(card:self.card, cardSize:self.size))
        addChild(CardNode.getNameNode(card:self.card, cardSize:self.size))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

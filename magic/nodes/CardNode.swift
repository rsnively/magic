import Foundation
import SpriteKit

class CardNode: SKSpriteNode {
    unowned var card:Card
    
    private static let cardAspectRatio:CGFloat = 0.714
    private static func getMaximumCardSize(for size:CGSize) -> CGSize {
        return size.width > size.height * cardAspectRatio
            ? CGSize(width:size.height * cardAspectRatio, height:size.height)
            : CGSize(width:size.width, height:size.width / cardAspectRatio)
    }
    
    private static func getBackgroundColor(for card:Card) -> UIColor {
        var cs = card.colors
        for subtype in card.subtypes {
            let color = getColorForLandType(subtype:subtype)
            if color != nil { cs.insert(color!) }
        }
        return getUIColor(for:cs)
    }
    
    private static func getNameNode(card:Card, cardSize:CGSize) -> SKLabelNode {
        let node = SKLabelNode(text:card.name)
        node.fontName = "HelveticaNeue"
        node.fontColor = UIColor.black
        node.fontSize = cardSize.height * 0.1
        node.position = CGPoint(x: (node.frame.width * 1.3 - cardSize.width) / 2.0, y: cardSize.height / 2.0 - node.frame.height * 1.3)
        return node
    }
    
    init(card:Card, allowedSize:CGSize) {
        self.card = card
        super.init(texture:nil, color:CardNode.getBackgroundColor(for:card), size:CardNode.getMaximumCardSize(for:allowedSize))
        let borderNode = SKShapeNode(rectOf: self.size, cornerRadius: 3.0)
        borderNode.strokeColor = UIColor.black
        addChild(borderNode)
        addChild(CardNode.getNameNode(card:self.card, cardSize:self.size))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos: CGPoint) { assert(false) }
    func touchMoved(toPoint pos: CGPoint) { assert(false) }
    func touchUp(atPoint pos : CGPoint) { assert(false) }
    public var touchPoint:CGPoint? = nil
    var touching:Bool {
        return self.touchPoint != nil
    }
}

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
    
    private static func getImageNode(card:Card, cardSize: CGSize, full: Bool) -> SKNode {
        let texture = SKTexture(imageNamed: card.getSetCode() + String(card.getCollectorsNumber()) + (full ? "full" : ""))

        let node = SKSpriteNode(texture: texture)
        let aspectRatio = texture.size().width / texture.size().height
        node.scale(to:CGSize(width: cardSize.width, height: cardSize.width / aspectRatio))
        
        return node
    }
    
    init(card:Card, allowedSize:CGSize) {
        self.card = card
        super.init(texture:nil, color: SKColor.clear, size:CardNode.getMaximumCardSize(for:allowedSize))
        if card.attacking {
            let attackBorder = SKShapeNode(rectOf: self.size * 1.1, cornerRadius: 3.0)
            attackBorder.strokeColor = SKColor.red
            attackBorder.fillColor = SKColor.red
            addChild(attackBorder)
        }
        addChild(CardNode.getImageNode(card: self.card, cardSize: self.size, full: true))

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

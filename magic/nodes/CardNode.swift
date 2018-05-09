import Foundation
import SpriteKit

class CardNode: SKSpriteNode {
    var moved = false
    var card:Card
    
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
            if color != nil { cs.append(color!) }
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
        addChild(CardNode.getNameNode(card:self.card, cardSize:self.size))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var startingPosition = CGPoint.zero
    private var touchPoint:CGPoint? = nil
    var touching:Bool {
        return self.touchPoint != nil
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if self.hasActions() {
            return
        }
        touchPoint = convert(pos, from:parent!)
        moved = false
        startingPosition = position
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
        position = pos - touchPoint!
    }
    
    func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            (self.scene as! GameScene).expandedCard = self.card
        }
        
        let moveAction = SKAction.move(to: startingPosition, duration: 0.5)
        moveAction.timingMode = .easeOut
        run(moveAction)
    }
}

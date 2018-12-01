import Foundation
import SpriteKit

class CardNode: SKSpriteNode {
    unowned var card:Object
    
    var abilitySelector: AbilitySelector?
    
    private static let cardAspectRatio:CGFloat = 0.714
    private static func getMaximumCardSize(for size:CGSize) -> CGSize {
        return size.width > size.height * cardAspectRatio
            ? CGSize(width:size.height * cardAspectRatio, height:size.height)
            : CGSize(width:size.width, height:size.width / cardAspectRatio)
    }
    
    private static func getImageNode(card:Object, cardSize: CGSize, full: Bool) -> SKNode {
        var texture: SKTexture
        if !card.isRevealedToHuman() {
            texture = SKTexture(imageNamed: "cardback.jpg")
        } else if let token = card as? Token {
            texture = SKTexture(imageNamed: token.getSetCode() + "t" + String(token.getCollectorsNumber()) + (full ? "full" : ""))
        } else if let nontoken = card as? Card {
            texture = SKTexture(imageNamed: nontoken.getSetCode() + String(nontoken.getCollectorsNumber()) + (full ? "full" : ""))
        } else {
            texture = SKTexture()
            assert(false)
        }

        let node = SKSpriteNode(texture: texture)
        let aspectRatio = texture.size().width / texture.size().height
        node.scale(to:CGSize(width: cardSize.width, height: cardSize.width / aspectRatio))
        
        return node
    }
    
    private static func getCounterLabelNode(type: Counter, amount: Int, index: Int, cardSize: CGSize) -> SKNode {
        let node = SKShapeNode(rectOf: CGSize(width: cardSize.width * 0.5, height: cardSize.height * 0.12))
        node.strokeColor = UIColor(white: 0, alpha: 0.8)
        node.fillColor = UIColor(white: 0, alpha: 0.8)
        node.zPosition = 0.1
        node.position = CGPoint(x: cardSize.width / 2.0, y: cardSize.height / 2.0 - cardSize.height * 0.11 * CGFloat(1 + index))
        
        let labelNode = SKLabelNode(text: type.rawValue + ": " + String(amount))
        labelNode.fontColor = UIColor.green // todo, red when detrimental
        labelNode.fontSize = cardSize.height * 0.09
        labelNode.zPosition = 0.2
        labelNode.position = CGPoint(x: 0, y: -labelNode.fontSize / 2.0)
        node.addChild(labelNode)
        
        return node
    }
    
    init(card:Object, allowedSize:CGSize) {
        self.card = card
        let size = CardNode.getMaximumCardSize(for: allowedSize)
        super.init(texture:nil, color: SKColor.clear, size:size)
        if card.attacking {
            let attackBorder = SKShapeNode(rectOf: self.size * 1.1, cornerRadius: 3.0)
            attackBorder.strokeColor = SKColor.red
            attackBorder.fillColor = SKColor.red
            addChild(attackBorder)
        }
        if card.isType(.Creature) && (card.powerOrToughnessUndefined() || (card.getPower() != card.getBasePower() || card.getToughness() != card.getBaseToughness())) {
            let powerToughnessNode = SKLabelNode(text: String(card.getPower()) + "/" + String(card.getToughness()))
            powerToughnessNode.fontColor = UIColor.blue // todo, red when less
            powerToughnessNode.fontSize = allowedSize.height * 0.1;
            powerToughnessNode.position = CGPoint(x: 0, y: size.height * -0.4)
            powerToughnessNode.zPosition = 0.1
            addChild(powerToughnessNode)
        }
        addChild(CardNode.getImageNode(card: self.card, cardSize: self.size, full: true))
        
        var numCounterLabelNodes = 0
        for (counter, amount) in card.counters {
            addChild(CardNode.getCounterLabelNode(type: counter, amount: amount, index: numCounterLabelNodes, cardSize: size))
            numCounterLabelNodes += 1
        }
        
        if card.isSelectingAbility() {
            abilitySelector = AbilitySelector(object: card, cardSize: size)
            abilitySelector!.zPosition = 0.2
            addChild(abilitySelector!)
        }
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

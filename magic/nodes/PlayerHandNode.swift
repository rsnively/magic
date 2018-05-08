import Foundation
import SpriteKit

class PlayerHandNode: SKNode {
    var cardNodes:[CardNode] = []
    
    private let cardMargin:CGFloat = 3.0
    
    init(hand:[Card], size:CGSize) {
        
        let cardSize = CGSize(width:size.width * 0.4, height:size.height)

        for card in hand {
            cardNodes.append(CardNode(card:card, allowedSize:cardSize))
        }
        super.init()
        
        for i in 0 ..< cardNodes.count {
            cardNodes[i].position = CGPoint(x:(CGFloat(i)  - CGFloat(cardNodes.count) / 2.0 + 0.5) * (cardNodes[i].size.width + cardMargin), y:self.position.y)
            addChild(cardNodes[i])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

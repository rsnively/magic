import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var game:Game
    var playerHandNode:PlayerHandNode
    
    private var expandedCardNode:CardNode? = nil
    var expandedCard:Card? {
        get {
            return expandedCardNode?.card
        }
        set(newExpandedCard) {
            if newExpandedCard == nil {
                expandedCardNode?.removeFromParent()
                expandedCardNode = nil
            } else {
                expandedCardNode = CardNode(card:newExpandedCard!, allowedSize:self.size * 0.9)
                addChild(expandedCardNode!)
                expandedCardNode!.zPosition = 2.0
                expandedCardNode!.position = expandedCardNode!.convert(CGPoint(x:size.width / 2.0, y:size.height / 2.0), from:self)
            }
        }
    }
    
    override init(size:CGSize) {
        game = Game()
        playerHandNode = PlayerHandNode(hand:game.player1.hand, size:CGSize(width:size.width * 0.6, height:size.height * 0.2))
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        playerHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * -0.05)

        addChild(playerHandNode)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if expandedCard != nil {
            return
        }
        playerHandNode.touchDown(atPoint:convert(pos, to:playerHandNode))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if expandedCard != nil {
            return
        }
        playerHandNode.touchMoved(toPoint:convert(pos, to:playerHandNode))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if expandedCard != nil {
            expandedCard = nil
            return
        }
        playerHandNode.touchUp(atPoint:convert(pos, to:playerHandNode))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

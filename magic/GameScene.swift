import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var game:Game
    var playerHandNode:PlayerHandNode
    
    override init(size:CGSize) {
        game = Game()
        playerHandNode = PlayerHandNode(hand:game.player1.hand, size:CGSize(width:size.width * 0.6, height:size.height * 0.2))
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
//        playerHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * 0.05)
        playerHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * 0.5)

        addChild(playerHandNode)
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

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

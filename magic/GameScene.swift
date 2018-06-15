import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var playerHandNode:PlayerHandNode
    
    var playCardHeight:CGFloat
    var playerLandsNode:LandsNode
    var playerCreaturesNode:CreaturesNode
    
    var manaPoolNode:ManaPoolNode
    
    var stackNode:StackNode
    
    var commandButtonsNode: CommandButtonsNode
    
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
    
    static func getAllowedPlayerHandSize(gameSize: CGSize) -> CGSize {
        return CGSize(width:gameSize.width * 0.6, height:gameSize.height * 0.2)
    }
    
    static func getAllowedPlayerLandsSize(gameSize: CGSize) -> CGSize {
        return CGSize(width:gameSize.width * 0.4, height: gameSize.height * 0.2)
    }
    
    static func getAllowedPlayerCreaturesSize(gameSize: CGSize) -> CGSize {
        return CGSize(width: gameSize.width, height: gameSize.height * 0.2)
    }
    
    static func getAllowedManaPoolSize(gameSize: CGSize) -> CGSize {
        return CGSize(width:100, height:50)
    }
    
    static func getAllowedStackSize(gameSize: CGSize) -> CGSize {
        return CGSize(width: gameSize.width, height: gameSize.height * 0.2)
    }
    
    static func getCommandButtonSize() -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    override init(size:CGSize) {
        playCardHeight = size.height * 0.1

        playerHandNode = PlayerHandNode(hand: Game.shared.player1.hand, size: GameScene.getAllowedPlayerHandSize(gameSize: size))
        playerLandsNode = LandsNode(lands: [], size: GameScene.getAllowedPlayerLandsSize(gameSize: size))
        playerCreaturesNode = CreaturesNode(creatures: [], size: GameScene.getAllowedPlayerCreaturesSize(gameSize: size))
        manaPoolNode = ManaPoolNode()
        stackNode = StackNode()
        commandButtonsNode = CommandButtonsNode(size: GameScene.getCommandButtonSize())
        
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        playerHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * -0.05)
        playerLandsNode.position = CGPoint(x:size.width * 0.25, y: size.height * 0.3)
        playerCreaturesNode.position = CGPoint(x:size.width * 0.5, y: size.height * 0.5)
        manaPoolNode.position = CGPoint(x:size.width * 0.5, y: (playerLandsNode.position.y + playerHandNode.position.y) / 2.0)
        stackNode.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        
        commandButtonsNode.position.x = size.width - GameScene.getCommandButtonSize().width / 2.0
        commandButtonsNode.position.y = GameScene.getCommandButtonSize().height * 2.0

        addChild(playerHandNode)
        addChild(playerLandsNode)
        addChild(playerCreaturesNode)
        addChild(manaPoolNode)
        addChild(stackNode)
        addChild(commandButtonsNode)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if expandedCard != nil {
            return
        }
        playerHandNode.touchDown(atPoint:convert(pos, to:playerHandNode))
        playerLandsNode.touchDown(atPoint:convert(pos, to:playerLandsNode))
        playerCreaturesNode.touchDown(atPoint:convert(pos, to:playerCreaturesNode))
        
        commandButtonsNode.touchDown(atPoint:convert(pos, to:commandButtonsNode))
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
        playerLandsNode.touchUp(atPoint:convert(pos, to:playerLandsNode))
        playerCreaturesNode.touchUp(atPoint:convert(pos, to:playerCreaturesNode))
        
        commandButtonsNode.touchUp(atPoint:convert(pos, to:commandButtonsNode))
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
    
    func redraw() {
        playerHandNode.setHand(cards: Game.shared.player1.hand, size: GameScene.getAllowedPlayerHandSize(gameSize: size))
        playerLandsNode.setLands(lands: Game.shared.player1.getLands(), size: GameScene.getAllowedPlayerLandsSize(gameSize: size))
        playerCreaturesNode.setCreatures(creatures: Game.shared.player1.getCreatures(), size: GameScene.getAllowedPlayerCreaturesSize(gameSize: size))
        manaPoolNode.setManaPool(manaPool: Game.shared.player1.getManaPool(), size:GameScene.getAllowedManaPoolSize(gameSize: size))
        stackNode.setStack(stack: Game.shared.theStack, size:GameScene.getAllowedStackSize(gameSize: size))
    }
}

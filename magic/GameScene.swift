import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var playerHandNode:PlayerHandNode
    var playerLifeNode:LifeNode
    
    var playCardHeight:CGFloat
    var playerLandsNode:LandsNode
    var playerCreaturesNode:CreaturesNode
    var playerOtherPermanentsNode:PermanentsNode
    
    var manaPoolNode:ManaPoolNode
    
    var stackNode:StackNode
    
    var opponentHandNode:PlayerHandNode
    var opponentLifeNode:LifeNode
    var opponentLandsNode:LandsNode
    var opponentCreaturesNode:CreaturesNode
    
    var commandButtonsNode: CommandButtonsNode
    
    private var expandedCardNode:CardNode? = nil
    var expandedCard:Object? {
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
    static func getAllowedOpponentHandSize(gameSize: CGSize) -> CGSize {
        return CGSize(width:gameSize.width * 0.6, height:gameSize.height * 0.2)
    }
    
    static func getAllowedLifeNodeSize(gameSize: CGSize) -> CGSize {
        return CGSize(width: gameSize.width * 0.1, height: gameSize.height * 0.06)
    }
    
    static func getAllowedPlayerLandsSize(gameSize: CGSize) -> CGSize {
        return CGSize(width:gameSize.width * 0.4, height: gameSize.height * 0.2)
    }
    static func getAllowedOpponentLandsSize(gameSize: CGSize) -> CGSize {
        return getAllowedPlayerLandsSize(gameSize: gameSize)
    }
    
    static func getAllowedPlayerPermanentsSize(gameSize: CGSize) -> CGSize {
        return CGSize(width: gameSize.width * 0.4, height: gameSize.height * 0.2)
    }
    
    static func getAllowedPlayerCreaturesSize(gameSize: CGSize) -> CGSize {
        return CGSize(width: gameSize.width, height: gameSize.height * 0.2)
    }
    static func getAllowedOpponentCreaturesSize(gameSize: CGSize) -> CGSize {
        return getAllowedPlayerCreaturesSize(gameSize: gameSize)
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

        playerHandNode = PlayerHandNode(hand: Game.shared.player1.getHand(), rotateCards: false, size: GameScene.getAllowedPlayerHandSize(gameSize: size))
        playerLifeNode = LifeNode(player: Game.shared.player1, size: GameScene.getAllowedLifeNodeSize(gameSize: size))
        playerLandsNode = LandsNode(lands: [], size: GameScene.getAllowedPlayerLandsSize(gameSize: size))
        playerOtherPermanentsNode = PermanentsNode(permanents: [], size: GameScene.getAllowedPlayerPermanentsSize(gameSize: size))
        playerCreaturesNode = CreaturesNode(creatures: [], size: GameScene.getAllowedPlayerCreaturesSize(gameSize: size))
        manaPoolNode = ManaPoolNode()
        stackNode = StackNode()
        
        opponentHandNode = PlayerHandNode(hand: Game.shared.player2.getHand(), rotateCards: true,  size: GameScene.getAllowedOpponentHandSize(gameSize: size))
        opponentLifeNode = LifeNode(player: Game.shared.player2, size: GameScene.getAllowedLifeNodeSize(gameSize: size))
        opponentLandsNode = LandsNode(lands: [], size: GameScene.getAllowedOpponentLandsSize(gameSize: size))
        opponentCreaturesNode = CreaturesNode(creatures: [], size: GameScene.getAllowedOpponentCreaturesSize(gameSize: size))
        
        commandButtonsNode = CommandButtonsNode(size: GameScene.getCommandButtonSize())
        
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        playerHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * -0.05)
        playerLifeNode.position = CGPoint(x:size.width * 0.5, y: size.height * 0.08)
        playerLandsNode.position = CGPoint(x:size.width * 0.25, y: size.height * 0.24)
        playerOtherPermanentsNode.position = CGPoint(x:size.width * 0.75, y: size.height * 0.24)
        playerCreaturesNode.position = CGPoint(x:size.width * 0.5, y: size.height * 0.45)
        manaPoolNode.position = CGPoint(x:size.width * 0.5, y: (playerLandsNode.position.y + playerHandNode.position.y) / 2.0)
        
        stackNode.position = CGPoint(x: size.width * 0.33, y: size.height * 0.66)
        
        opponentHandNode.position = CGPoint(x:size.width * 0.5, y: size.height * 1.07)
        opponentLifeNode.position = CGPoint(x: size.width * 0.5, y: size.height * 0.95)
        opponentLandsNode.position = CGPoint(x: size.width * 0.25, y: size.height * 0.85)
        opponentCreaturesNode.position = CGPoint(x: size.width * 0.5, y: size.height * 0.65)
        
        commandButtonsNode.position.x = size.width - GameScene.getCommandButtonSize().width / 2.0
        commandButtonsNode.position.y = GameScene.getCommandButtonSize().height * 2.0

        addChild(playerHandNode)
        addChild(playerLifeNode)
        addChild(playerLandsNode)
        addChild(playerOtherPermanentsNode)
        addChild(playerCreaturesNode)
        addChild(manaPoolNode)
        addChild(stackNode)
        addChild(opponentHandNode)
        addChild(opponentLifeNode)
        addChild(opponentLandsNode)
        addChild(opponentCreaturesNode)
        addChild(commandButtonsNode)
        
        stackNode.zPosition = 1
        
        redraw()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if expandedCard != nil {
            return
        }
        playerHandNode.touchDown(atPoint:convert(pos, to:playerHandNode))
        playerLifeNode.touchDown(atPoint:convert(pos, to:playerLifeNode))
        playerLandsNode.touchDown(atPoint:convert(pos, to:playerLandsNode))
        playerOtherPermanentsNode.touchDown(atPoint:convert(pos, to:playerOtherPermanentsNode))
        playerCreaturesNode.touchDown(atPoint:convert(pos, to:playerCreaturesNode))
        
        stackNode.touchDown(atPoint:convert(pos, to:stackNode))
        
        commandButtonsNode.touchDown(atPoint:convert(pos, to:commandButtonsNode))
        
        opponentHandNode.touchDown(atPoint:convert(pos, to: opponentHandNode))
        opponentLifeNode.touchDown(atPoint:convert(pos, to:opponentLifeNode))
        opponentLandsNode.touchDown(atPoint:convert(pos, to:opponentLandsNode))
        opponentCreaturesNode.touchDown(atPoint:convert(pos, to:opponentCreaturesNode))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if expandedCard != nil {
            return
        }
        playerHandNode.touchMoved(toPoint:convert(pos, to:playerHandNode))
        playerLifeNode.touchMoved(toPoint:convert(pos, to:playerLifeNode))
        playerLandsNode.touchMoved(toPoint:convert(pos, to:playerLandsNode))
        playerOtherPermanentsNode.touchMoved(toPoint:convert(pos, to:playerOtherPermanentsNode))
        playerCreaturesNode.touchMoved(toPoint:convert(pos, to:playerCreaturesNode))
        
        stackNode.touchMoved(toPoint:convert(pos, to:stackNode))
        
        opponentHandNode.touchMoved(toPoint: convert(pos, to: opponentHandNode))
        opponentLifeNode.touchMoved(toPoint:convert(pos, to:opponentLifeNode))
        opponentLandsNode.touchMoved(toPoint:convert(pos, to:opponentLandsNode))
        opponentCreaturesNode.touchMoved(toPoint:convert(pos, to:opponentCreaturesNode))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if expandedCard != nil {
            expandedCard = nil
            return
        }
        let wasSelectingAbility = Game.shared.isSelectingAbility
        
        playerHandNode.touchUp(atPoint:convert(pos, to:playerHandNode))
        playerLifeNode.touchUp(atPoint:convert(pos, to:playerLifeNode))
        playerLandsNode.touchUp(atPoint:convert(pos, to:playerLandsNode))
        playerOtherPermanentsNode.touchUp(atPoint:convert(pos, to:playerOtherPermanentsNode))
        playerCreaturesNode.touchUp(atPoint:convert(pos, to:playerCreaturesNode))
        
        stackNode.touchUp(atPoint:convert(pos, to:stackNode))
        
        commandButtonsNode.touchUp(atPoint:convert(pos, to:commandButtonsNode))
        
        opponentHandNode.touchUp(atPoint: convert(pos, to: opponentHandNode))
        opponentLifeNode.touchUp(atPoint:convert(pos, to:opponentLifeNode))
        opponentLandsNode.touchUp(atPoint:convert(pos, to:opponentLandsNode))
        opponentCreaturesNode.touchUp(atPoint:convert(pos, to:opponentCreaturesNode))
        
        Game.shared.deselectBlocker()
        if wasSelectingAbility {
            Game.shared.selectingAbilityObject = nil
        }
        redraw()
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
        playerHandNode.setHand(cards: Game.shared.player1.getHand(), size: GameScene.getAllowedPlayerHandSize(gameSize: size))
        playerLifeNode.setLife(life: Game.shared.player1.getLife(), size: GameScene.getAllowedLifeNodeSize(gameSize: size))
        playerLandsNode.setLands(lands: Game.shared.player1.getLands(), size: GameScene.getAllowedPlayerLandsSize(gameSize: size))
        playerOtherPermanentsNode.setPermanents(permanents: Game.shared.player1.getPermanents().filter{ return !$0.isType(.Creature) && !$0.isType(.Land) }, size: GameScene.getAllowedPlayerPermanentsSize(gameSize: size))
        playerCreaturesNode.setCreatures(creatures: Game.shared.player1.getCreatures(), size: GameScene.getAllowedPlayerCreaturesSize(gameSize: size))
        manaPoolNode.setManaPool(manaPool: Game.shared.player1.getManaPool(), size:GameScene.getAllowedManaPoolSize(gameSize: size))
        stackNode.setStack(stack: Game.shared.theStack, size:GameScene.getAllowedStackSize(gameSize: size))
        opponentHandNode.setHand(cards: Game.shared.player2.getHand(), size: GameScene.getAllowedOpponentHandSize(gameSize: size))
        opponentLifeNode.setLife(life: Game.shared.player2.getLife(), size: GameScene.getAllowedLifeNodeSize(gameSize: size))
        opponentLandsNode.setLands(lands: Game.shared.player2.getLands(), size: GameScene.getAllowedOpponentLandsSize(gameSize: size))
        opponentCreaturesNode.setCreatures(creatures: Game.shared.player2.getCreatures(), size: GameScene.getAllowedOpponentCreaturesSize(gameSize: size))
        commandButtonsNode.update()
    }
}

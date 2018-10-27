import Foundation
import SpriteKit

class LifeNode: SKNode {
    private var touchPoint:CGPoint? = nil
    var touching:Bool {
        return self.touchPoint != nil
    }
    private var touchMoved: Bool = false
    unowned var player: Player
    
    private var backgroundNode: SKShapeNode
    
    func setLife(life: Int, size: CGSize) {
        removeAllChildren()
        
        let backgroundNode = SKShapeNode.init(circleOfRadius: min(size.width, size.height) / 2.0)
        backgroundNode.fillColor = SKColor.green
        addChild(backgroundNode)
        
        let labelNode = SKLabelNode.init(text: String(life))
        labelNode.fontName = "HelveticaNeue"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 12
        addChild(labelNode)
    }
    
    init(player: Player, size: CGSize) {
        self.player = player
        self.backgroundNode = SKShapeNode.init(circleOfRadius: min(size.width, size.height) / 2.0)
        super.init()
        setLife(life: player.getLife(), size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if backgroundNode.contains(pos) {
            touchPoint = convert(pos, from:parent!)
            touchMoved = false
        }
    }
    func touchMoved(toPoint pos: CGPoint) {
        if self.touching {
            touchMoved = true
        }
    }
    func touchUp(atPoint pos : CGPoint) {
        if touching && !touchMoved {
            if Game.shared.isTargeting && Game.shared.targetingEffects.last!.meetsRestrictions(target: player) {
                Game.shared.selectTarget(player)
            }
        }
        touchPoint = nil
        touchMoved = false
    }

}

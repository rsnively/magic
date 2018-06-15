import Foundation
import SpriteKit

class CommandButtonsNode: SKNode {
    var okayButton: SKSpriteNode
    
    func getOkayButtonText() -> String {
        return "Okay"
    }
    
    init(size: CGSize) {
        okayButton = SKSpriteNode(color: SKColor.green, size:size)
        super.init()
        addChild(okayButton)
        
        let labelNode = SKLabelNode(text:self.getOkayButtonText())
        labelNode.fontName = "HelveticaNeue"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 16
        okayButton.addChild(labelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var touching = false
    func touchDown(atPoint pos:CGPoint) {
        if okayButton.contains(pos) {
            touching = true
            okayButton.color = SKColor.orange
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        if touching {
            touching = false
            okayButton.color = SKColor.green
            if okayButton.contains(pos) {
                Game.shared.advanceGame()
                (self.scene as! GameScene).redraw()
            }
        }
    }
}

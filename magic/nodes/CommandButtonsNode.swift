import Foundation
import SpriteKit

class CommandButtonsNode: SKNode {
    var okayButton: SKSpriteNode
    var phaseLabel: SKLabelNode
    
    func getOkayButtonText() -> String {
        if Game.shared.isDeclaringAttackers() {
            return "Attack"
        }
        if Game.shared.isDeclaringBlockers() {
            return "Block"
        }
        if Game.shared.isTargeting && Game.shared.canFinishTargeting() {
            return "Done selecting targets"
        }
        if Game.shared.isTargeting {
            return "(Choose targets)"
        }
        if Game.shared.isChoosingCardToDiscard {
            return "Choose Card to Discard"
        }
        if Game.shared.isChoosingLegendaryToKeep {
            return "Choose " + Game.shared.choosingLegendaryToKeep! + " to keep"
        }
        if !Game.shared.theStack.isEmpty {
            return "Okay"
        }
        return "Next Phase"
    }
    
    init(size: CGSize) {
        okayButton = SKSpriteNode(color: SKColor.green, size:size)
        phaseLabel = SKLabelNode(text: Game.shared.getCurrentPhase().toString())
        super.init()
        addChild(okayButton)
        addChild(phaseLabel)
        update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        okayButton.removeAllChildren()
        let labelNode = SKLabelNode(text:self.getOkayButtonText())
        labelNode.fontName = "HelveticaNeue"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 16
        okayButton.addChild(labelNode)
        
        phaseLabel.text = (Game.shared.yourTurn() ? "Your " : "Opponent's ") + Game.shared.getCurrentPhase().toString()
        phaseLabel.position.y = okayButton.position.y + okayButton.size.height
        phaseLabel.fontName = "HelveticaNeue"
        phaseLabel.fontColor = UIColor.black
        phaseLabel.fontSize = 16
    }
    
    private var touching = false
    func touchDown(atPoint pos:CGPoint) {
        if okayButton.contains(pos) && (!Game.shared.isSelectingBesidesAttackBlock() || (Game.shared.isTargeting && Game.shared.canFinishTargeting())) {
            touching = true
            okayButton.color = SKColor.orange
            (self.scene as! GameScene).redraw()
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        if touching {
            touching = false
            okayButton.color = SKColor.green
            if okayButton.contains(pos) {
                Game.shared.advanceGame()
            }
        }
    }
}

import Foundation
import SpriteKit

class CommandButtonsNode: SKNode {
    var okayButton: SKSpriteNode
    var notOkayButton: SKSpriteNode
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
        if Game.shared.isCastingSpell {
            return "Pay " + Game.shared.castingSpell!.manaCost!.getString()
        }
        if Game.shared.isSelectingCards {
            return "Done Selecting"
        }
        if Game.shared.isChoosingCardToDiscard {
            return "Choose Card to Discard"
        }
        if Game.shared.isChoosingLegendaryToKeep {
            return "Choose " + Game.shared.choosingLegendaryToKeep! + " to keep"
        }
        if Game.shared.isResolvingOptionalEffect {
            return "Take Action"
        }
        if !Game.shared.theStack.isEmpty {
            return "Okay"
        }
        return "Next Phase"
    }
    
    func getNotOkayButtonText() -> String? {
        if Game.shared.isResolvingOptionalEffect {
            return "Decline"
        }
        return nil
    }
    
    init(size: CGSize) {
        okayButton = SKSpriteNode(color: SKColor.green, size:size)
        notOkayButton = SKSpriteNode(color: SKColor.red, size: size)
        phaseLabel = SKLabelNode(text: Game.shared.getCurrentPhase().toString())
        super.init()
        addChild(okayButton)
        addChild(notOkayButton)
        addChild(phaseLabel)
        update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        let fontName = "HelveticaNeue"
        let fontColor = UIColor.black
        let fontSize: CGFloat = 16.0
        
        okayButton.removeAllChildren()
        let labelNode = SKLabelNode(text:self.getOkayButtonText())
        labelNode.fontName = fontName
        labelNode.fontColor = fontColor
        labelNode.fontSize = fontSize
        okayButton.addChild(labelNode)
        
        notOkayButton.removeAllChildren()
        if let notOkayText = self.getNotOkayButtonText() {
            notOkayButton.alpha = 1.0
            let notOkayLabelNode = SKLabelNode(text: notOkayText)
            notOkayLabelNode.fontName = fontName
            notOkayLabelNode.fontColor = fontColor
            notOkayLabelNode.fontSize = fontSize
            notOkayButton.addChild(notOkayLabelNode)
        } else {
            notOkayButton.alpha = 0.0
        }
        notOkayButton.position.y = okayButton.position.y - okayButton.size.height
        
        phaseLabel.text = (Game.shared.yourTurn() ? "Your " : "Opponent's ") + Game.shared.getCurrentPhase().toString()
        phaseLabel.position.y = okayButton.position.y + okayButton.size.height
        phaseLabel.fontName = fontName
        phaseLabel.fontColor = fontColor
        phaseLabel.fontSize = fontSize
    }
    
    private var touchingOkay = false
    private var touchingNotOkay = false
    func touchDown(atPoint pos:CGPoint) {
        if okayButton.contains(pos) && (!Game.shared.isSelectingBesidesAttackBlock() || (Game.shared.isTargeting && Game.shared.canFinishTargeting()) || Game.shared.isResolvingOptionalEffect || (Game.shared.isSelectingCards)) {
            touchingOkay = true
            okayButton.color = SKColor.orange
            (self.scene as! GameScene).redraw()
        }
        else if notOkayButton.contains(pos) && (Game.shared.isResolvingOptionalEffect) {
            touchingNotOkay = true
            notOkayButton.color = SKColor.gray
            (self.scene as! GameScene).redraw()
        }
    }
    
    func touchUp(atPoint pos:CGPoint) {
        if touchingOkay {
            touchingOkay = false
            okayButton.color = SKColor.green
            if okayButton.contains(pos) {
                if Game.shared.isResolvingOptionalEffect {
                    Game.shared.resolvingOptionalEffect!.resolve([:])
                    Game.shared.resolvingOptionalEffect = nil
                }
                else if Game.shared.isSelectingCards {
                    Game.shared.doneSelectingCards()
                }
                else {
                    Game.shared.advanceGame()
                }
            }
        }
        else if touchingNotOkay {
            touchingNotOkay = false
            notOkayButton.color = SKColor.red
            if notOkayButton.contains(pos) {
                Game.shared.resolvingOptionalEffect?.resetTargets()
                Game.shared.resolvingOptionalEffect = nil
            }
        }
    }
}

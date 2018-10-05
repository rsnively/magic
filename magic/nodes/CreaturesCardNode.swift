import Foundation
import SpriteKit

class CreaturesCardNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if Game.shared.isTargeting {
                if Game.shared.targetingEffect!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    (self.scene as! GameScene).redraw()
                    return
                }
            } else if card.canActivateAbilities() {
                // todo: multiple activated abilities
                if card.getController().getManaPool().canAfford(card.activatedAbilities.first!) {
                    card.getController().getManaPool().payFor(card.activatedAbilities.first!)
                    card.activatedAbilities.first!.activate()
                    (self.scene as! GameScene).redraw()
                    return
                }
            }
            (self.scene as! GameScene).expandedCard = self.card
        } else if card.canAttack() {
            card.attacking = !card.attacking
            (self.scene as! GameScene).redraw()
        }
    }
}

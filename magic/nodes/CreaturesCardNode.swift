import Foundation
import SpriteKit

class CreaturesCardNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
        if card.canBlock() {
            Game.shared.selectBlocker(self.card)
        }
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if Game.shared.isTargeting {
                if Game.shared.targetingEffects.last!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    (self.scene as! GameScene).redraw()
                    return
                }
            } else if card.canActivateAbilities() {
                // todo: multiple activated abilities
                let ability = card.activatedAbilities.first!
                if card.getController().getManaPool().canAfford(ability) && (!(card.isTapped || card.hasSummoningSickness()) || !ability.getCost().getTapCost()) {
                    card.getController().payFor(ability.getCost(), card)
                    ability.activate()
                    (self.scene as! GameScene).redraw()
                    return
                }
            } else if let selectedBlocker = Game.shared.getSelectedBlocker() {
                if card.attacking && selectedBlocker.canBlockAttacker(card) {
                    selectedBlocker.block(card)
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

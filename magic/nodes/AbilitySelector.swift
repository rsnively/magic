import Foundation
import SpriteKit

class AbilitySelector: SKNode {
    private var abilityNodes: [AbilitySelectorNode] = []
    
    init(object: Object, cardSize: CGSize) {
        super.init()
        
        for i in 0..<object.activatedAbilities.count {
            abilityNodes.append(AbilitySelectorNode(cardSize: cardSize, object: object, index: i))
            addChild(abilityNodes[i])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchUp(atPoint pos: CGPoint) {
        for abilityNode in abilityNodes {
            if abilityNode.contains(pos) {
                abilityNode.touchUp(atPoint: pos)
            }
        }
    }
}

class AbilitySelectorNode: SKNode {
    private var object: Object
    private var index: Int
    private var ability: ActivatedAbility {
        return object.activatedAbilities[index]
    }
    
    private var backgroundNode: SKSpriteNode
    private var labelNode: SKLabelNode
    
    init(cardSize: CGSize, object: Object, index: Int) {
        self.object = object
        self.index = index
        
        self.labelNode = SKLabelNode(text: object.activatedAbilities[index].getString())
        self.labelNode.fontColor = UIColor.white
        self.labelNode.fontSize = cardSize.height * 0.1;
        self.labelNode.position = CGPoint(x: cardSize.width * 0.25, y: cardSize.height * 0.11 * CGFloat(index) - cardSize.height * 0.05)
        self.labelNode.zPosition = 0.1
        
        self.backgroundNode = SKSpriteNode(color: SKColor.black, size:CGSize(width: self.labelNode.frame.width, height: cardSize.height * 0.11))
        self.backgroundNode.position = CGPoint(x: cardSize.width * 0.25, y: cardSize.height * 0.11 * CGFloat(index))

        super.init()
        
        addChild(backgroundNode)
        addChild(labelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchUp(atPoint pos: CGPoint) {
        if object.getController().getManaPool().canAfford(ability) && (!object.isTapped || !ability.getCost().getTapCost()) {
            object.getController().payFor(ability.getCost(), object)
            ability.activate()
        }
    }
}

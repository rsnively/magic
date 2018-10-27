import Foundation

protocol ActivatedAbility {
    func getSource() -> Object
    func getCost() -> Cost
    func getString() -> String
    func activate() -> Void
    func resolve() -> Void
}

class UntargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var string: String
    private var cost: Cost
    private var manaAbility: Bool
    
    init(source: Object, string: String, cost: Cost, effect:@escaping () -> Void, manaAbility: Bool = false) {
        self.source = source
        self.string = string
        self.cost = cost
        self.manaAbility = manaAbility
        super.init(name: "Activated Ability of " + source.getName())
        effects.append(UntargetedEffect(effect))
    }
    
    
    func getSource() -> Object {
        return source
    }
    
    func getString() -> String {
        return string
    }
    
    func getCost() -> Cost {
        return cost
    }
    
    func activate() {
        if manaAbility {
            resolve()
        } else {
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return source.getController()
    }
    
    override func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}

class TargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var string: String
    private var cost: Cost
    private var manaAbility: Bool
    
    init(source: Object, string: String, cost: Cost, effect: TargetedEffect, manaAbility: Bool = false) {
        self.source = source
        self.string = string
        self.cost = cost
        self.manaAbility = manaAbility
        super.init(name: "Activated Ability of " + source.getName())
        effects.append(effect)
    }
    
    func getSource() -> Object {
        return source
    }
    func getCost() -> Cost {
        return cost
    }
    func getString() -> String {
        return string
    }
    
    func activate() {
        let effect = effects.first(where: { return $0.requiresTarget() }) as! TargetedEffect?
        if Game.shared.hasTargets(effect!) {
            Game.shared.targetingEffects.append(effect!)
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return source.getController()
    }
    
    override func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}

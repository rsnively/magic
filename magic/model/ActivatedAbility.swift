import Foundation

protocol ActivatedAbility {
    func requiresTargets() -> Bool
    func getSource() -> Object
    func getCost() -> Cost
    func activate() -> Void
    func resolve() -> Void
}

class UntargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var cost: Cost
    private var manaAbility: Bool
    
    init(source: Object, cost: Cost, effect:@escaping (Object) -> (), manaAbility: Bool = false) {
        self.source = source
        self.cost = cost
        self.manaAbility = manaAbility
        super.init(name: "Activated Ability of " + source.getName())
        effects.append(UntargetedEffect(effect))
    }
    
    func getSource() -> Object {
        return source
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
                effect.resolve(source: getSource())
            }
        }
    }
}

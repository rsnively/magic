import Foundation

protocol Effect {
    func isOptional() -> Bool
    func requiresTarget() -> Bool
    func numPossibleTargets() -> Int
    func numRequiredTargets() -> Int
    func resolve() -> Void
}

class UntargetedEffect: Effect {
    private var effect:() -> Void
    private var optional: Bool
    
    init(effect:@escaping () -> Void, optional: Bool = false) {
        self.effect = effect
        self.optional = optional
    }

    func isOptional() -> Bool {
        return optional
    }
    func requiresTarget() -> Bool {
        return false
    }
    func numPossibleTargets() -> Int {
        return 0
    }
    func numRequiredTargets() -> Int {
        return 0
    }
    
    func resolve() {
        effect()
    }
}

class TargetedEffect: Effect {
    private var optional: Bool
    private var restrictions: [(Targetable) -> Bool]
    private var effect: ([Targetable]) -> Void
    private var targets: [Targetable] = []
    private var distinctTargets: Bool
    private var requiredTargets: Int
    
    static func AnyPlayer(_ player: Player) -> Bool { return true }
    static func AnyTarget(_ targetable: Targetable) -> Bool {
        if let object = targetable as? Object {
            return object.isType(.Creature) || object.isType(.Planeswalker)
        }
        if let _ = targetable as? Player {
            return true
        }
        return false
    }
    
    init(restrictions: [(Targetable) -> Bool], effect: @escaping ([Targetable]) -> Void, distinctTargets: Bool = false, requiredTargets: Int?, effectOptional: Bool = false) {
        self.optional = effectOptional
        self.restrictions = restrictions
        self.effect = effect
        self.distinctTargets = distinctTargets
        self.requiredTargets = requiredTargets ?? restrictions.count
    }
    
    convenience init(restriction: @escaping (Targetable) -> Bool, effect: @escaping (Targetable) -> Void, distinctTargets: Bool = false, targetOptional: Bool = false, effectOptional: Bool = false) {
        self.init(restrictions: [restriction], effect: { objects in effect(objects.first!) }, distinctTargets: distinctTargets, requiredTargets: targetOptional ? 0 : 1, effectOptional: effectOptional)
    }
    
    static func SingleObject(restriction: @escaping (Object) -> Bool, effect: @escaping (Object) -> Void, targetOptional: Bool = false, effectOptional: Bool = false) -> TargetedEffect {
        let targetableRestriction: (Targetable) -> Bool = { targetable in
            if let targetableObject = targetable as? Object {
                return restriction(targetableObject)
            }
            return false
        }
        let targetableEffect: (Targetable) -> Void = { effect($0 as! Object) }
        return TargetedEffect(restriction: targetableRestriction, effect: targetableEffect, distinctTargets: false, targetOptional: targetOptional, effectOptional: effectOptional)
    }
    static func MultiObject(restrictions: [(Object) -> Bool], effect: @escaping ([Object]) -> Void, distinctTargets: Bool = false, requiredTargets: Int? = nil, effectOptional: Bool = false) -> TargetedEffect {
        var targetableRestrictions: [(Targetable) -> Bool] = []
        for restriction in restrictions {
            targetableRestrictions.append({ targetable in
                if let targetableObject = targetable as? Object {
                    return restriction(targetableObject)
                }
                return false
            })
        }
        let targetableEffect: ([Targetable]) -> Void = { targets in
            var objectTargets: [Object] = []
            for target in targets {
                objectTargets.append(target as! Object)
            }
            effect(objectTargets)
        }
        return TargetedEffect(restrictions: targetableRestrictions, effect: targetableEffect, distinctTargets: distinctTargets, requiredTargets: requiredTargets, effectOptional: effectOptional)
    }
    static func SinglePlayer(restriction: @escaping (Player) -> Bool, effect: @escaping (Player) -> Void, targetOptional: Bool = false, effectOptional: Bool = false) -> TargetedEffect {
        let targetableRestriction: (Targetable) -> Bool = { targetable in
            if let targetablePlayer = targetable as? Player {
                return restriction(targetablePlayer)
            }
            return false
        }
        let targetableEffect: (Targetable) -> Void = { effect($0 as! Player) }
        return TargetedEffect(restriction: targetableRestriction, effect: targetableEffect, distinctTargets: false, targetOptional: targetOptional, effectOptional: effectOptional)
    }
    
    func isOptional() -> Bool {
        return optional
    }
        
    func requiresTarget() -> Bool {
        return true
    }
    
    func numPossibleTargets() -> Int {
        return restrictions.count
    }
    
    func numRequiredTargets() -> Int {
        return requiredTargets
    }
    
    func canFinishTargeting() -> Bool {
        return targets.count >= requiredTargets
    }
    
    func targetAlreadySelected(_ target: Targetable) -> Bool {
        return targets.contains(where: { $0 === target })
    }
    
    func meetsRestrictions(target: Targetable) -> Bool {
        return !target.isHexproof() && restrictions[targets.count](target) && !(distinctTargets && targetAlreadySelected(target))
    }
    
    func selectTarget(_ target: Targetable) {
        self.targets.append(target)
    }
    
    func allTargetsSelected() -> Bool {
        return targets.count == restrictions.count
    }
    
    func resolve() {
        // TODO: Still need to be able to partially invalidate effects with multiple targets (ie: Destroy two target creatures - if one target is no longer valid, the other creature still needs to get destroyed)
        var targetsValid = true
        for i in 0..<restrictions.count {
            if i < targets.count {
                if targets[i].isHexproof() || !restrictions[i](targets[i]) {
                    targetsValid = false
                }
            }
        }
        if targetsValid {
            effect(targets)
        }
        targets.removeAll()
    }
}

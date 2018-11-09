import Foundation

protocol Effect {
    func requiresTarget() -> Bool
    func numTargets() -> Int
    func resolve() -> Void
}

class UntargetedEffect: Effect {
    private var effect:() -> Void
    
    init(_ effect:@escaping () -> Void) {
        self.effect = effect
    }

    func requiresTarget() -> Bool {
        return false
    }
    func numTargets() -> Int {
        return 0
    }
    
    func resolve() {
        effect()
    }
}

class TargetedEffect: Effect {
    private var restrictions: [(Targetable) -> Bool]
    private var effect: ([Targetable]) -> Void
    private var targets: [Targetable] = []
    
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
    
    init(restrictions: [(Targetable) -> Bool], effect: @escaping ([Targetable]) -> Void) {
        self.restrictions = restrictions
        self.effect = effect
    }
    
    convenience init(restriction: @escaping (Targetable) -> Bool, effect: @escaping (Targetable) -> Void) {
        self.init(restrictions: [restriction], effect: { objects in effect(objects.first!) })
    }
    
    static func SingleObject(restriction: @escaping (Object) -> Bool, effect: @escaping (Object) -> Void) -> TargetedEffect {
        let targetableRestriction: (Targetable) -> Bool = { targetable in
            if let targetableObject = targetable as? Object {
                return restriction(targetableObject)
            }
            return false
        }
        let targetableEffect: (Targetable) -> Void = { effect($0 as! Object) }
        return TargetedEffect(restriction: targetableRestriction, effect: targetableEffect)
    }
    static func MultiObject(restrictions: [(Object) -> Bool], effect: @escaping ([Object]) -> Void) -> TargetedEffect {
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
        return TargetedEffect(restrictions: targetableRestrictions, effect: targetableEffect)
    }
    static func SinglePlayer(restriction: @escaping (Player) -> Bool, effect: @escaping (Player) -> Void) -> TargetedEffect {
        let targetableRestriction: (Targetable) -> Bool = { targetable in
            if let targetablePlayer = targetable as? Player {
                return restriction(targetablePlayer)
            }
            return false
        }
        let targetableEffect: (Targetable) -> Void = { effect($0 as! Player) }
        return TargetedEffect(restriction: targetableRestriction, effect: targetableEffect)
    }
        
    func requiresTarget() -> Bool {
        return true
    }
    func numTargets() -> Int {
        return restrictions.count
    }
    
    func meetsRestrictions(target: Targetable) -> Bool {
        return restrictions[targets.count](target)
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
            if !restrictions[i](targets[i]) {
                targetsValid = false
            }
        }
        if targetsValid {
            effect(targets)
        }
        targets.removeAll()
    }
}

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
    private var restrictions: [(Object) -> Bool]
    private var effect: ([Object]) -> Void
    private var targets: [Object] = []
    
    init(restrictions: [(Object) -> Bool], effect: @escaping ([Object]) -> Void) {
        self.restrictions = restrictions
        self.effect = effect
    }
    
    convenience init(restriction: @escaping (Object) -> Bool, effect: @escaping (Object) -> Void) {
        self.init(restrictions: [restriction], effect: { objects in effect(objects.first!) })
    }
    
    func requiresTarget() -> Bool {
        return true
    }
    func numTargets() -> Int {
        return restrictions.count
    }
    
    func meetsRestrictions(target: Object) -> Bool {
        return restrictions[targets.count](target)
    }
    
    func selectTarget(_ target: Object) {
        self.targets.append(target)
    }
    
    func allTargetsSelected() -> Bool {
        return targets.count == restrictions.count
    }
    
    func resolve() {
        // todo: only if at least one target still valid
        effect(targets)
    }
}

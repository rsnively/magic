import Foundation

protocol Effect {
    func requiresTarget() -> Bool
    func resolve(source: Object)
}

class UntargetedEffect: Effect {
    private var resolveFunc:(Object) -> ()
    
    init(_ resolveFunc:@escaping (Object) -> ()) {
        self.resolveFunc = resolveFunc
    }
    
    func requiresTarget() -> Bool {
        return false
    }
    
    func resolve(source: Object) {
        resolveFunc(source)
    }
}

class TargetedEffect: Effect {
    private var targetingRestriction:(Object) -> Bool
    private var resolveFunc:(Object, Object) -> ()
    
    weak var target: Object?
    
    init(targetingRestriction: @escaping (Object) -> Bool, effect:@escaping (Object, Object) -> ()) {
        self.targetingRestriction = targetingRestriction
        self.resolveFunc = effect
    }
    
    func requiresTarget() -> Bool {
        return true
    }
    
    func meetsRestrictions(target: Object) -> Bool{
        return targetingRestriction(target)
    }
    
    func selectTarget(_ target: Object) {
        self.target = target
    }
    
    func resolve(source: Object) {
        // todo only if target is still valid
        if let target = target {
            resolveFunc(source, target)
        }
    }
}

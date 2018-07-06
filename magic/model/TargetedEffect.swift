import Foundation

class TargetedEffect: Effect {
    private var targetingRestriction:(Object) -> Bool
    private var resolveFunc:(Object, Object) -> ()
    
    weak var target: Object?
    
    init(targetingRestriction: @escaping (Object) -> Bool, _ resolveFunc:@escaping (Object, Object) -> ()) {
        self.targetingRestriction = targetingRestriction
        self.resolveFunc = resolveFunc
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
        if let target = target {
            resolveFunc(source, target)
        }
    }
}

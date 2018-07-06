import Foundation

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

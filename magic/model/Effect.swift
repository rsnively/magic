import Foundation

class Effect {
    private var resolveFunc:(Object) -> ()
    
    init(_ resolveFunc:@escaping (Object) -> ()) {
        self.resolveFunc = resolveFunc
    }
    
    func resolve(source: Object) {
        resolveFunc(source)
    }
}

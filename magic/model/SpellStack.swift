import Foundation

class SpellStack: NSObject {
    private var stackObjects:Stack<Object>
    
    override init() {
        self.stackObjects = Stack<Object>()
    }
    
    func push(_ object: Object) {
        // TODO: cast / ability triggers
        stackObjects.push(object)
    }
    
    func pop() -> Object? {
        // TODO: resolve? or let caller do that?
        return stackObjects.pop()
    }
}

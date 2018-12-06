import Foundation

class SpellStack: NSObject {
    private var stackObjects:Stack<Object>
    var count: Int {
        return stackObjects.count
    }
    var isEmpty: Bool {
        return stackObjects.isEmpty
    }
    var asArray: [Object] {
        return stackObjects.asArray()
    }
    
    override init() {
        self.stackObjects = Stack<Object>()
    }
    
    func push(_ object: Object) {
        stackObjects.push(object)
        Game.shared.checkStateBasedActions()
    }
    
    func resolveTop() {
        if let top = stackObjects.pop() {
            top.getController().resolve(object: top)
        }
    }
}

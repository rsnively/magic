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
        object.reveal()
        Game.shared.checkStateBasedActions()
    }
    
    func contains(_ object: Object) -> Bool {
        return stackObjects.contains(condition: { $0 == object })
    }
    
    func containsWhere(_ condition: (Object) -> Bool) -> Bool{
        return stackObjects.contains(condition: condition)
    }
    
    func resolveTop() {
        if let top = stackObjects.pop() {
            top.getController().resolve(object: top)
        }
    }
    
    func remove(_ object: Object) {
        stackObjects.remove(condition: { $0 == object })
    }
    
    func getStaticAbilities() -> [StaticAbility] {
        var staticAbilities: [StaticAbility] = []
        stackObjects.forEach({
            staticAbilities += $0.staticAbilities
        })
        return staticAbilities
    }
}

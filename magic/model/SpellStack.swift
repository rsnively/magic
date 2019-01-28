import Foundation

class SpellStack: NSObject {
    private var stackObjects:Stack<Object>
    private var pendingStackObjects: [Object] = [] // Don't push until finish checking SBAs
    
    private var blockingCheckingSBAs: Bool = false
    var checkingStateBasedActions: Bool {
        get { return blockingCheckingSBAs }
        set (newState) {
            if newState {
                blockingCheckingSBAs = true
            }
            else {
                blockingCheckingSBAs = false
                // TODO somehow need to re-check restrictions and target availability for targeted effects
                pendingStackObjects.forEach({ push($0) })
            }
        }
    }
    
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
        if checkingStateBasedActions {
            pendingStackObjects.append(object)
            return
        }
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

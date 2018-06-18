import Foundation

class Object: NSObject {
    var name:String?
    var colors:Set<Color> = []
    var manaCost:ManaCost?
    var supertypes:Set<Supertype> = []
    var types:Set<Type> = []
    var subtypes:Set<Subtype> = []
    var power:Int?
    var toughness:Int?
    weak var controller:Player?
    
    init(name:String) {
        self.name = name
        super.init()
    }
    
    func setController(controller: Player) {
        self.controller = controller
    }
    
    func getController() -> Player {
        return controller!
    }
    
    func setManaCost(_ manaCostString: String, setColorAccordingly: Bool = true) {
        manaCost = ManaCost(manaCostString)
        if setColorAccordingly {
            colors = manaCost!.getColors()
        }
    }
    
    func addType(_ type: Type) { types.insert(type) }
    func addType(_ supertype: Supertype) { supertypes.insert(supertype) }
    func addType(_ subtype: Subtype) { subtypes.insert(subtype) }
    func isType(_ type: Type) -> Bool { return types.contains(type) }
    func isType(_ supertype: Supertype) -> Bool { return supertypes.contains(supertype) }
    func isType(_ subtype: Subtype) -> Bool { return subtypes.contains(subtype) }
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    
    func resolve() {
        
    }
    
}

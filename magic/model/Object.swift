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
    var effects:[Effect] = []
    
    var defender: Bool = false
    var flash: Bool = false
    var lifelink: Bool = false
    var vigilance: Bool = false
    
    weak var controller: Player?
    var attacking: Bool = false
    
    private var tapped: Bool = false
    var isTapped: Bool {
        return tapped
    }
    
    private var turnEnteredBattlefield: Int?
    
    init(name:String) {
        self.name = name
        super.init()
    }
    
    func getName() -> String {
        return name!
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
    
    func getConvertedManaCost() -> Int {
        if let manaCost = manaCost {
            return manaCost.converted()
        }
        return 0 // nil?
    }
    
    private func clearTypes() {
        supertypes.removeAll()
        types.removeAll()
        subtypes.removeAll()
    }
    func addType(_ type: Type) { types.insert(type) }
    func addType(_ supertype: Supertype) { supertypes.insert(supertype) }
    func addType(_ subtype: Subtype) { subtypes.insert(subtype) }
    func setType(_ type: Type) { clearTypes(); addType(type); }
    func setType(_ type: Type, _ subtype: Subtype) { clearTypes(); addType(type); addType(subtype); }
    func setType(_ type1: Type, _ type2: Type, _ subtype: Subtype) { clearTypes(); addType(type1); addType(type2); addType(subtype); }
    func setType(_ type: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(type); addType(subtype1); addType(subtype2); }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype); }
    func setType(_ supertype: Supertype, _ type: Type, _ subtype1: Subtype, _ subtype2: Subtype) { clearTypes(); addType(supertype); addType(type); addType(subtype1); addType(subtype2); }
    func isType(_ type: Type) -> Bool { return types.contains(type) }
    func isType(_ supertype: Supertype) -> Bool { return supertypes.contains(supertype) }
    func isType(_ subtype: Subtype) -> Bool { return subtypes.contains(subtype) }
    func isPermanent() -> Bool { return isType(Type.Artifact) || isType(Type.Creature) || isType(Type.Enchantment) || isType(Type.Land) || isType(Type.Planeswalker) }
    
    func tap() {
        tapped = true
    }
    func untap() {
        tapped = false
    }
    
    func addEffect(_ effect: Effect) {
        effects.append(effect)
    }
    
    func requiresTargets() -> Bool {
        return effects.contains(where: { $0.requiresTarget() })
    }
    
    func resolve() {
        if isPermanent() {
            turnEnteredBattlefield = Game.shared.getCurrentTurn()
        }
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve(source: self)
            }
        }
    }
    
    func getPower() -> Int {
        return power!
    }
    
    func getToughness() -> Int {
        return toughness!
    }
    
    func hasSummoningSickness() -> Bool {
        if !isType(.Creature) {
            return false
        }
        if let turnEnteredBattlefield = turnEnteredBattlefield {
            let currentTurn = Game.shared.getCurrentTurn()
            return getController().active ? (turnEnteredBattlefield >= currentTurn) : (turnEnteredBattlefield >= currentTurn - 1)
        }
        return false
    }
    
    func canAttack() -> Bool {
        return Game.shared.isDeclaringAttackers() && getController().active && isType(.Creature) && !hasSummoningSickness() && !defender
    }
    
    func bounce() {
        getController().bouncePermanent(self)
    }
    
    func destroy() {
        getController().destroyPermanent(self)
    }
    
    // This permanent is dealing damage equal to its power to something
    func dealsDamage() {
        if lifelink {
            getController().gainLife(getPower())
        }
    }
    
}

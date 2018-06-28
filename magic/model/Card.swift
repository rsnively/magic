import Foundation

class Card: Object {
    private weak var owner: Player?
    private var rarity: Rarity
    private var flavorText: String = ""
    private var setCode: String
    private var collectorsNumber: Int
    private var tapped: Bool
    var isTapped: Bool {
        return tapped
    }
    private var markedDamage: Int
    
    init(name: String, rarity: Rarity, set: String, number: Int) {
        self.rarity = rarity
        self.setCode = set
        self.collectorsNumber = number
        self.tapped = false
        self.markedDamage = 0
        super.init(name: name)
    }
    
    func setOwner(owner: Player) {
        self.owner = owner
        self.controller = owner
    }
    
    func getOwner() -> Player {
        return owner!
    }
    
    func usesStack() -> Bool {
        return !self.types.contains(Type.Land)
    }
    
    func canPlay() -> Bool {
        if let controller = controller {
            if !controller.hasPriority {
                return false
            }
        }
        if !isType(Type.Instant) && !Game.shared.theStack.isEmpty {
            return false
        }
        
        return true

    }
    
    func getSetCode() -> String {
        return setCode
    }
    
    func setFlavorText(_ flavorText: String) {
        self.flavorText = flavorText
    }
    
    func tap() {
        tapped = true
    }
    func untap() {
        tapped = false
    }
    func dealDamage(_ amount: Int) {
        markedDamage += amount
    }
}

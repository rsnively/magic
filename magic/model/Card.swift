import Foundation

class Card: Object {
    private var rarity: Rarity
    private var flavorText: String = ""
    private var setCode: String
    private var collectorsNumber: Int
    
    init(name: String, rarity: Rarity, set: String, number: Int) {
        self.rarity = rarity
        self.setCode = set
        self.collectorsNumber = number
        super.init(name: name)
    }
    
    func usesStack() -> Bool {
        return !self.types.contains(Type.Land)
    }
    
    func canPlay() -> Bool {
        if Game.shared.isDeclaringAttackers() || Game.shared.isTargeting { return false }
        if !getController().hasPriority { return false }
        if !(isType(.Instant) || flash) && !(Game.shared.theStack.isEmpty && getController().active && Game.shared.getCurrentPhase().sorcerySpeed()) { return false }
        if (isType(.Land) && Game.shared.landWasPlayedThisTurn()) { return false }
        
        return true

    }
    
    func getSetCode() -> String {
        return setCode
    }
    
    func getCollectorsNumber() -> Int {
        return collectorsNumber
    }
    
    func setFlavorText(_ flavorText: String) {
        self.flavorText = flavorText
    }
}

import Foundation

class Card: Object {
    private var rarity: Rarity
    private var flavorText: String = ""
    private var setCode: String
    private var collectorsNumber: Int
    
    static func randomCard() -> Card {
        let r = Int.random(in: 1 ... 5)
        if r == 1 {
            return GRN.RandomCard()
        }
        if r == 2 {
            return M19.RandomCard()
        }
//        if r == 3 {
            return DOM.RandomCard()
//        }
//        if r == 4 {
//            return RIX.RandomCard()
//        }
//        return XLN.RandomCard()
    }
    
    init(name: String, rarity: Rarity, set: String, number: Int) {
        self.rarity = rarity
        self.setCode = set
        self.collectorsNumber = number
        super.init(name: name)
    }
    
    // Are these the same?
    func usesStack() -> Bool {
        return !self.types.contains(Type.Land)
    }
    override func isSpell() -> Bool {
        return !self.types.contains(Type.Land)
    }
    
    func canPlay() -> Bool {
        if Game.shared.isSelecting() { return false }
        if !getController().hasPriority { return false }
        if !(isType(.Instant) || flash) && !(getController().canCastSorcery()) { return false }
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

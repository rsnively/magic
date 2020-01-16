import Foundation

class Card: Object {
    private var rarity: Rarity
    private var flavorText: String = ""
    private var setCode: String
    private var collectorsNumber: Int
    
    static func All() -> [Card] {
        let allCardFuncs = XLN.cards + RIX.cards + DOM.cards + M19.cards + GRN.cards + RNA.cards + WAR.cards + M20.cards + ELD.cards
        return allCardFuncs.map({ $0() })
    }
    
    static func randomCard() -> Card {
        let r = Int.random(in: 1 ... 10)
        if r == 1 {
            return XLN.RandomCard()
        }
        if r == 2 {
            return RIX.RandomCard()
        }
        if r == 3 {
            return DOM.RandomCard()
        }
        if r == 4 {
            return M19.RandomCard()
        }
        if r == 5 {
            return GRN.RandomCard()
        }
        if r == 6 {
            return RNA.RandomCard()
        }
        if r == 7 {
            return WAR.RandomCard()
        }
        if r == 8 {
            return M20.RandomCard()
        }
        if r == 9 {
            return ELD.RandomCard()
        }
        return THB.RandomCard()
    }
    
    static func randomStandardCard() -> Card {
        return THB.RandomCard()
//        let r = Int.random(in: 1 ... 6)
//        if r == 1 {
//            return GRN.RandomCard()
//        }
//        if r == 2 {
//            return RNA.RandomCard()
//        }
//        if r == 3 {
//            return WAR.RandomCard()
//        }
//        if r == 4 {
//            return M20.RandomCard()
//        }
//        if r == 5 {
//            return ELD.RandomCard()
//        }
//        return THB.RandomCard()
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
    
    func canPlay() -> Bool {
        if Game.shared.isSelecting() { return false }
        if !getController().hasPriority { return false }
        if !(isType(.Instant) || flash) && !(getController().canCastSorcery()) { return false }
        if (isType(.Land) && Game.shared.landWasPlayedThisTurn()) { return false }
        if let effect = spellAbility {
            if effect.requiresTarget() && !Game.shared.hasTargets(effect as! TargetedEffect) { return false }
        }
        
        return true
    }
    
    func getRarity() -> Rarity {
        return rarity
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

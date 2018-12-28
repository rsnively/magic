import Foundation

class ManaPool: NSObject {
    private var manaPool: [Mana] = []
    var count : Int {
        return manaPool.count
    }
    
    func at(_ index: Int) -> Mana? {
        return manaPool[index]
    }
    
    func getColorAmount(_ color: Color) -> Int {
        return manaPool.filter{ return $0.getColor() == color }.count
    }
    func getColorlessAmount() -> Int {
        return manaPool.filter{ return $0.isColorless() }.count
    }
    
    func removeColor(_ color: Color?) {
        for i in 0 ..< manaPool.count {
            if manaPool[i].getColor() == color {
                manaPool.remove(at: i)
                return
            }
        }
        assert(false)
    }
    
    func empty() {
        manaPool.removeAll()
    }
    
    private static func canAffordHybridMana(
        white: Int,
        blue: Int,
        black: Int,
        red: Int,
        green: Int,
        colorless: Int,
        hybrid: [HybridMana]
    ) -> Bool {
        if white < 0 || blue < 0 || black < 0 || red < 0 || green < 0 || colorless < 0 {
            return false
        }
        if hybrid.isEmpty {
            return true
        }
        for mana in hybrid {
            let newHybrid = hybrid.filter({ $0 !== mana })
            if mana.includesColor(.White) && ManaPool.canAffordHybridMana(white: white - 1, blue: blue, black: black, red: red, green: green, colorless: colorless, hybrid: newHybrid) { return true }
            if mana.includesColor(.Blue) && ManaPool.canAffordHybridMana(white: white, blue: blue - 1, black: black, red: red, green: green, colorless: colorless, hybrid: newHybrid) { return true }
            if mana.includesColor(.Black) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black - 1, red: red, green: green, colorless: colorless, hybrid: newHybrid) { return true }
            if mana.includesColor(.Red) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black, red: red - 1, green: green, colorless: colorless, hybrid: newHybrid) { return true }
            if mana.includesColor(.Green) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black, red: red, green: green - 1, colorless: colorless, hybrid: newHybrid) { return true }
        }
        return false
    }
    
    private func payForHybridMana(_ hybridMana: [HybridMana]) {
        for mana in hybridMana {
            let newHybrid = hybridMana.filter({ $0 !== mana })
            let white = getColorAmount(.White)
            let blue = getColorAmount(.Blue)
            let black = getColorAmount(.Black)
            let red = getColorAmount(.Red)
            let green = getColorAmount(.Green)
            let colorless = getColorlessAmount()
            if mana.includesColor(.White) && ManaPool.canAffordHybridMana(white: white - 1, blue: blue, black: black, red: red, green: green, colorless: colorless, hybrid: newHybrid) {
                removeColor(.White)
                payForHybridMana(newHybrid)
                return
            }
            if mana.includesColor(.Blue) && ManaPool.canAffordHybridMana(white: white, blue: blue - 1, black: black, red: red, green: green, colorless: colorless, hybrid: newHybrid) {
                removeColor(.Blue)
                payForHybridMana(newHybrid)
                return
            }
            if mana.includesColor(.Black) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black - 1, red: red, green: green, colorless: colorless, hybrid: newHybrid) {
                removeColor(.Black)
                payForHybridMana(newHybrid)
                return
            }
            if mana.includesColor(.Red) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black, red: red - 1, green: green, colorless: colorless, hybrid: newHybrid) {
                removeColor(.Red)
                payForHybridMana(newHybrid)
                return
            }
            if mana.includesColor(.Green) && ManaPool.canAffordHybridMana(white: white, blue: blue, black: black, red: red, green: green - 1, colorless: colorless, hybrid: newHybrid) {
                removeColor(.Green)
                payForHybridMana(newHybrid)
                return
            }
            assert(false)
        }
    }
    
    func canAfford(_ manaCost: ManaCost) -> Bool {
        let white = getColorAmount(.White) - manaCost.getColorAmount(.White)
        let blue = getColorAmount(.Blue) - manaCost.getColorAmount(.Blue)
        let black = getColorAmount(.Black) - manaCost.getColorAmount(.Black)
        let red = getColorAmount(.Red) - manaCost.getColorAmount(.Red)
        let green = getColorAmount(.Green) - manaCost.getColorAmount(.Green)
        let colorless = getColorlessAmount() - manaCost.getColorlessAmount()
        
        if !ManaPool.canAffordHybridMana(white: white, blue: blue, black: black, red: red, green: green, colorless: colorless, hybrid: manaCost.getHybridMana()) {
            return false
        }
        let remaining = white + blue + black + red + green + colorless - manaCost.getHybridMana().count
        let generic = remaining - manaCost.getGenericMana()
        
        if (white < 0) || (blue < 0) || (black < 0) || (red < 0) || (green < 0) || (colorless < 0) || (generic < 0) {
            return false
        }
        return true
    }
    
    func canAfford(_ card: Card) -> Bool {
        if let castingCost = card.castingCost {
            return canAfford(castingCost)
        }
        return true
    }
    
    func canAfford(_ activatedAbility: ActivatedAbility) -> Bool {
        return canAfford(activatedAbility.getCost().getManaCost())
    }
    
    func add(_ mana: Mana) {
        self.manaPool.append(mana)
    }
    
    func payFor(_ manaCost: ManaCost) {
        for coloredMana in manaCost.getColoredMana() {
            removeColor(coloredMana.getColor())
        }
        payForHybridMana(manaCost.getHybridMana())
        //todo allow control over this bit
        manaPool.removeLast(manaCost.getGenericMana())
    }
    
    func payFor(_ card: Card) {
        if let castingCost = card.castingCost {
            payFor(castingCost)
        }
    }
    
    func payFor(_ activatedAbility: ActivatedAbility) {
        payFor(activatedAbility.getCost().getManaCost())
    }
    
}

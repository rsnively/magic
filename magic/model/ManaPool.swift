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
    
    func canAfford(_ manaCost: ManaCost) -> Bool {
        let white = getColorAmount(.White) - manaCost.getColorAmount(.White)
        let blue = getColorAmount(.Blue) - manaCost.getColorAmount(.Blue)
        let black = getColorAmount(.Black) - manaCost.getColorAmount(.Black)
        let red = getColorAmount(.Red) - manaCost.getColorAmount(.Red)
        let green = getColorAmount(.Green) - manaCost.getColorAmount(.Green)
        let colorless = getColorlessAmount() - manaCost.getColorlessAmount()
        let generic = white + blue + black + red + green + colorless - manaCost.getGenericMana()
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

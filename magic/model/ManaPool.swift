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
        return manaPool.map{ return $0.getColor() == color ? 1 : 0 }.reduce(0, +)
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
    
    func canAfford(_ card: Card) -> Bool {
        if let manaCost = card.manaCost {
            let white = getColorAmount(.White) - manaCost.getColorAmount(.White)
            let blue = getColorAmount(.Blue) - manaCost.getColorAmount(.Blue)
            let black = getColorAmount(.Black) - manaCost.getColorAmount(.Black)
            let red = getColorAmount(.Red) - manaCost.getColorAmount(.Red)
            let green = getColorAmount(.Green) - manaCost.getColorAmount(.Green)
            let generic = white + blue + black + red + green - manaCost.getGenericMana()
            if (white < 0) || (blue < 0) || (black < 0) || (red < 0) || (green < 0) || (generic < 0) {
                return false
            }
        }
        return true
    }
    
    func add(_ mana: Mana) {
        self.manaPool.append(mana)
    }
    
    func payFor(_ card: Card) {
        if let manaCost = card.manaCost {
            for coloredMana in manaCost.getColoredMana() {
                removeColor(coloredMana.getColor())
            }
            //todo allow control over this bit
            manaPool.removeLast(manaCost.getGenericMana())
        }
    }
    
}

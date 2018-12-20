import Foundation

class ManaCost: NSObject, NSCopying {
    private var coloredMana: [Mana] = []
    private var genericMana:Int = 0
    
    init(_ manaString: String) {
        for char in manaString {
            if isDigit(char) {
                self.genericMana *= 10
                self.genericMana += toInt(char)
            }
            else {
                let color = Color(rawValue: char)
                assert(color != nil, "Unexpected character passed in to mana cost: " + String(char))
                coloredMana.append(Mana(color))
            }
        }
        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ManaCost("")
        copy.coloredMana = self.coloredMana
        copy.genericMana = self.genericMana
        return copy
    }
    
    func getString() -> String {
        var ret = ""
        if genericMana > 0 {
            ret += String(genericMana)
        }
        for mana in coloredMana {
            if let color = mana.getColor() {
                ret += String(color.rawValue)
            } else {
                ret += "C"
            }
        }
        return ret
    }
    
    func getColors() -> Set<Color> {
        var colors = Set<Color>()
        for mana in coloredMana {
            if let color = mana.getColor() {
                colors.insert(color)
            }
        }
        return colors
    }
    
    func getColoredMana() -> [Mana] {
        return coloredMana
    }
    func getColorAmount(_ color: Color) -> Int {
        return coloredMana.filter{ return $0.getColor() == color }.count
    }
    func getColorlessAmount() -> Int {
        return coloredMana.filter{ return $0.isColorless() }.count
    }
    func getGenericMana() -> Int {
        return genericMana
    }
    
    func converted() -> Int {
        return coloredMana.count + genericMana
    }
    
    func reducedBy(_ genericAmount: Int) -> ManaCost {
        let copy = self.copy() as! ManaCost
        copy.genericMana = max(0, copy.genericMana - genericAmount)
        return copy
    }
}

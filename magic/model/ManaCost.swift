import Foundation

class ManaCost: NSObject {
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
}

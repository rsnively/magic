import Foundation

class ManaCost: NSObject, NSCopying {
    private var coloredMana: [Mana] = []
    private var genericMana: Int = 0
    private var hybridMana: [HybridMana] = []
    
    private func parseHybridMana(_ manaString: inout String) {
        while let openIndex = manaString.firstIndex(of: "{") {
            let closeIndex = manaString.firstIndex(of: "}")!
            
            let color1 = Color(rawValue: manaString[manaString.index(after: openIndex)])!
            let color2 = Color(rawValue: manaString[manaString.index(before: closeIndex)])!
            hybridMana.append(HybridMana(color1, color2))
            
            manaString.removeSubrange(openIndex...closeIndex)
        }
    }
    
    private func parseColoredMana(_ manaString: inout String) {
        for char in manaString {
            if !isDigit(char) {
                let color = Color(rawValue: char)!
                coloredMana.append(Mana(color))
            }
        }
        manaString.removeAll(where: { !isDigit($0) })
    }
    
    private func parseGenericMana(_ manaString: inout String) {
        for char in manaString {
            if isDigit(char) {
                self.genericMana *= 10
                self.genericMana += toInt(char)
            }
        }
        manaString.removeAll(where: { isDigit($0 ) })
    }
    
    init(_ manaString: String) {
        var manaString = manaString
        super.init()
        parseHybridMana(&manaString)
        parseColoredMana(&manaString)
        parseGenericMana(&manaString)
        assert(manaString.isEmpty)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ManaCost("")
        copy.coloredMana = self.coloredMana
        copy.genericMana = self.genericMana
        copy.hybridMana = self.hybridMana
        return copy
    }
    
    func getString() -> String {
        var ret: String = ""
        for mana in coloredMana {
            if let color = mana.getColor() {
                ret += String(color.rawValue)
            } else {
                ret += "C"
            }
        }
        for mana in hybridMana {
            ret += mana.getString()
        }
        if genericMana > 0 {
            ret += String(genericMana)
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
        for mana in hybridMana {
            colors.formUnion(mana.getColors())
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
    func getHybridMana() -> [HybridMana] {
        return hybridMana
    }
    func getHybridAmount(_ color: Color) -> Int {
        return hybridMana.filter{ return $0.includesColor(color) }.count
    }
    
    func converted() -> Int {
        return coloredMana.count + genericMana + hybridMana.count
    }
    func pips(color: Color) -> Int {
        return getColorAmount(color) + getHybridAmount(color)
    }
    
    func reducedBy(_ genericAmount: Int) -> ManaCost {
        let copy = self.copy() as! ManaCost
        copy.genericMana = max(0, copy.genericMana - genericAmount)
        return copy
    }
    func increasedBy(_ genericAmount: Int) -> ManaCost {
        let copy = self.copy() as! ManaCost
        copy.genericMana += genericAmount
        return copy
    }
}

import Foundation

class HybridMana {
    private let color1: Color
    private let color2: Color
    
    init(_ color1: Color, _ color2: Color) {
        self.color1 = color1
        self.color2 = color2
    }
    
    func getColors() -> Set<Color> {
        return [color1, color2]
    }
    
    func includesColor(_ color: Color) -> Bool {
        return color1 == color || color2 == color
    }
}

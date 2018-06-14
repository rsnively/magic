import Foundation
import UIKit

enum Color: Character {
    case White = "W"
    case Blue = "U"
    case Black = "B"
    case Red = "R"
    case Green = "G"
}

func getUIColor(for color:Color) -> UIColor {
    switch color {
    case .White: return UIColor.lightGray
    case .Blue: return UIColor.cyan
    case .Black: return UIColor.darkGray
    case .Red: return UIColor.red
    case .Green: return UIColor.green
    }
}

func getUIColor(for color:Color?) -> UIColor {
    return color.map(getUIColor) ?? UIColor.gray
}

func getUIColor(for colors:Set<Color>) -> UIColor {
    return colors.count > 1 ? UIColor.yellow : getUIColor(for:colors.first)
}

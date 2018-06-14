import Foundation

func isDigit(_ char: Character) -> Bool {
    return "0" <= char && char <= "9"
}

func toInt(_ digit: Character) -> Int {
    if let number = Int(String(digit)) {
        return number
    }
    fatalError("Can't convert character to integer")
}

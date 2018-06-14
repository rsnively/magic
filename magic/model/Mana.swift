import Foundation

class Mana: NSObject {
    private let color:Color?
    
    init(_ color:Color?) {
        self.color = color
        super.init()
    }
    
    func getColor() -> Color? {
        return color
    }
    
    func isColorless() -> Bool {
        return color == nil
    }
    
}

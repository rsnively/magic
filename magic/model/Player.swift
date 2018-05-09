import Foundation

class Player: NSObject {
    var hand:[Card] = []
    
    override init() {
        for _ in 1 ... 7 {
            let c = Card(name:"Island")
            c.supertypes.append(.Basic)
            c.types.append(.Land)
            c.subtypes.append(.Island)
            hand.append(c)
        }
        super.init()
    }
}

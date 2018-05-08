import Foundation

class Player: NSObject {
    var hand:[Card] = []
    
    override init() {
        for _ in 1 ... 7 {
            let c = Card(name:"Island")
            hand.append(c)
        }
        super.init()
    }
}

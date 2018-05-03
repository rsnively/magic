import Foundation

class Player: NSObject {
    var hand:[Card] = []
    
    override init() {
        for _ in 1 ... 60 {
            hand.append(Card(name:"Island"))
        }
        super.init()
    }
}

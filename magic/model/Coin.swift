import Foundation

class Coin
{
    private var result: Bool
    var heads: Bool {
        get { return result }
    }
    var tails: Bool {
        get { return !result }
    }
    
    
    static func flip() -> Coin {
        return Coin(result: Bool.random())
    }
    
    private init(result: Bool) {
        self.result = result
    }
}

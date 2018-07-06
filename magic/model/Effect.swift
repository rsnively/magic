import Foundation

protocol Effect {
    func requiresTarget() -> Bool
    func resolve(source: Object)
}

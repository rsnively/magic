import Foundation

struct Stack<T> {
    private var elements:[T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func top() -> T? {
        return elements.last
    }
    
    func asArray() -> [T] {
        return elements
    }
    
    func contains(condition: (T) -> Bool) -> Bool {
        return elements.contains(where: condition)
    }
    
    func forEach(_ f: (T) -> Void) {
        elements.forEach(f)
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    mutating func remove(condition: (T) -> Bool) {
        if let index = elements.firstIndex(where: condition) {
            elements.remove(at: index)
        }
    }
}

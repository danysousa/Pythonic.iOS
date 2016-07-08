// Python docs: https://docs.python.org/2/library/stdtypes.html#sequence-types-str-unicode-list-tuple-bytearray-buffer-xrange
//
// Most frequently used:
//    2 list.sort
//    2 list.pop
//    2 list.append
//    1 list.reverse
//    1 list.remove
//    1 list.insert
//
// >>> filter(lambda s: not s.startswith("_"), dir([]))
//   append: Already in Swift.
//   count: Added.
//   extend: Already in Swift.
//   index: Added.
//   insert: Failed to add. (TODO)
//   pop: Added, but due to a compiler bug it must be defined in test file for tests to pass.
//   remove: Added.
//   reverse: Added as "reverseInPlace" to avoid name collision with built-in Array.reverse.
//   sort: Failed to add. Name collision with built-in Array.sort. (TODO)

public typealias list = Swift.Array

extension Array: BooleanType {
    public var boolValue: Bool {
        return len(self) != 0
    }
}

public extension Array {
    public mutating func clear() {
        self.removeAll()
    }

    public mutating func reverseInPlace() {
        let newArrayElements = Array(self.reverse())
        self.clear()
        self.appendContentsOf(newArrayElements)
    }

    public func count<T where T: Equatable>(element: T) -> Int {
        if element is Array.Element {
            return Swift.unsafeBitCast(self, [T].self).filter({ $0 == element }).count
        }
        return 0
    }

    public mutating func remove<T where T: Equatable>(element: T) {
        if let i = index(element) {
            self.removeAtIndex(i)
        }
    }

    public func index<T where T: Equatable>(element: T) -> Int? {
        if element is Array.Element {
            if let idx = Swift.unsafeBitCast(self, [T].self).indexOf(element) {
                return idx
            }
        }
        return nil
    }

    public mutating func pop(index: Int?) -> Array.Element? {
        let i = index ?? self.count - 1
        guard self.count > 0 && i >= 0 && i < self.count else {
            return nil
        }
        defer { self.removeAtIndex(i) }
        return self[i]
    }

    public mutating func pop() -> Array.Element? {
        return self.pop(nil)
    }
}

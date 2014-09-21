// The Swift standard library currently lacks a Set class. This is an
// attempt to fix that :-)
//
//  "A set object is an unordered collection of distinct hashable
//   objects. Common uses include membership testing, removing
//   duplicates from a Sequence, and computing mathematical
//   operations such as intersection, union, difference, and symmetric
//   difference."
//
// Usage:
//
//   var set1 = Set([0, 1, 2])
//   set1.add(3)
//   set1.add(3)
//   assert(set1 == Set([0, 1, 2, 3]))
//
//   var set2 = Set([2, 4, 8, 16])
//   assert(set1 + set2 == Set([0, 1, 2, 3, 4, 8, 16]))
//   assert(set1 - set2 == Set([0, 1, 3]))
//   assert(set1 & set2 == Set([2]))
//
//   assert(Set([1, 1, 1, 2, 2, 3, 3, 4]) == Set([1, 2, 3, 4]))

public final class Set<T : Hashable> : ArrayLiteralConvertible, CollectionType,
    Comparable, Equatable, ExtensibleCollectionType, Hashable, BooleanType,
    Printable, SequenceType {
    // final to speed up things:
    // "Is your dictionary an property (i.e. ivar) of a class?  If so,
    //  this is probably a known problem where an extra copy of the
    //  dictionary is being made for no reason.  As a workaround, try
    //  marking the property "final"." (quoting a dev forum post by
    //  Chris Lattner)
    //
    // Before final: 2000 inserts in 7.16 seconds.
    // After final:  2000 inserts in 0.03 seconds.
    // Speed-up: 239x
    private final var internalDict = [T : Void]()

    public required init() {
    }

    public init<R : SequenceType where R.Generator.Element == T>(_ initialSequenceType: R) {
        self.extend(initialSequenceType)
    }

    public func contains(element: T) -> Bool {
        // "return self.internalDict[element] != nil" gives …
        // "error: 'T' is not convertible to 'DictionaryIndex<T, Void>'"
        // Workaround:
        if let _ = self.internalDict[element] {
            return true
        }
        return false
    }

    public func add(element: T) {
        self.internalDict[element] = Void()
    }

    public func remove(element: T) {
        self.internalDict[element] = nil
    }

    public func discard(element: T) {
        self.remove(element)
    }

    public func clear() {
        self.internalDict = [T : Void]()
    }

    public func intersection(other: Set<T>) -> Set<T> {
        var newSet = Set<T>()
        for entry in self {
            if other.contains(entry) {
                newSet.add(entry)
            }
        }
        return newSet
    }

    public func isDisjoint(other: Set<T>) -> Bool {
        return self.intersection(other) == Set()
    }

    // Lowercase name for Python compatibility.
    public func isdisjoint(other: Set<T>) -> Bool {
        return self.isDisjoint(other)
    }

    // Implement ArrayLiteralConvertible (allows for "var set: Set<Int> = [2, 4, 8]")
    public class func convertFromArrayLiteral(elements: T...) -> Set<T> {
        return Set(elements)
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    public subscript (i: Int) -> T {
        return Array(self.internalDict.keys)[i]
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    public var startIndex: Int {
        return 0
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    public var endIndex: Int {
        return self.internalDict.count
    }

    // Implement ExtensibleCollection
    public func reserveCapacity(n: Int) {
        // NOOP.
    }

    // Implement ExtensibleCollection
    public func extend<R : SequenceType where R.Generator.Element == T>(SequenceType: R) {
        let elements = [T](SequenceType)
        for element in elements {
            self.add(element)
        }
    }

    // Implement ExtensibleCollection
    public func append(element: T) {
        self.add(element)
    }

    // Implement Hashable
    public var hashValue: Int {
        var totalHash = 0
        for entry in self {
            // Opt in to the overflow behavior when calculating totalHash
            totalHash = totalHash &+ entry.hashValue
        }
        return totalHash
    }

    // Implement LogicValue (allows for "if set { … }")
    public var boolValue: Bool {
        return countElements(self) != 0
    }

    // Implement Printable (allows for "println(set)")
    public var description: String {
        var s = "Set(["
        for (i, value) in enumerate(self) {
            s += "\(value)"
            if i != countElements(self) - 1 {
                s += ", "
            }
        }
        s += "])"
        return s
    }

    // Implement SequenceType (allows for "for x in set")
    public func generate() -> IndexingGenerator<[T]> {
        return Array(self.internalDict.keys).generate()
    }

}

// Implement Comparable (allows for "if set1 < set2 { … }")
public func <<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    if lhs == rhs {
        return false
    }
    for element in lhs {
        if !rhs.contains(element) {
            return false
        }
    }
    return true
}

// Implement Equatable (allows for "if set1 == set2 { … }")
public func ==<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

public func +<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>(lhs)
    newSet.extend(rhs)
    return newSet
}

public func -<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>(lhs)
    for entry in rhs {
        newSet.remove(entry)
    }
    return newSet
}

public func &<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.intersection(rhs)
}

public func |<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs + rhs
}

public func +=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.extend(rhs)
}

public func |=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.extend(rhs)
}

public func &=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in lhs {
        if rhs.contains(entry) {
            lhs.add(entry)
        } else {
            lhs.remove(entry)
        }
    }
}

public func +=<T : Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.add(rhs)
}

public func -=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in rhs {
        lhs.remove(entry)
    }
}

public func -=<T : Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.remove(rhs)
}

// For Python compatibility.
public func set<T : Hashable>() -> Set<T> {
    return Set()
}

// For Python compatibility.
public func set<T : Hashable>(initialArray: [T]) -> Set<T> {
    return Set(initialArray)
}

// For Python compatibility.
public func set<T : Hashable>(initialSet: Set<T>) -> Set<T> {
    return Set(initialSet)
}

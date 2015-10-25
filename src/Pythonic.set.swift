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

extension Set: BooleanType, Comparable {
    public mutating func add(element: Element) {
        self.insert(element)
    }

    public mutating func discard(element: Element) {
        self.remove(element)
    }

    mutating public func clear() {
        self.removeAll()
    }

    public func isDisjoint(other: Set<Element>) -> Bool {
        return self.isDisjointWith(other)
    }

    // Lowercase name for Python compatibility.
    public func isdisjoint(other: Set<Element>) -> Bool {
        return self.isDisjointWith(other)
    }
    
    // Implement CollectionType
    public mutating func append(element: Element) {
        self.add(element)
    }

    // Implement LogicValue (allows for "if set { … }")
    public var boolValue: Bool {
        return self.count != 0
    }
}

// Implement Comparable (allows for "if set1 < set2 { … }")
public func <<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isStrictSubsetOf(rhs)
}

public func +<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.union(rhs)
}

public func -<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.subtract(rhs)
}

public func &<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.intersect(rhs)
}

public func |<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs + rhs
}

public func +=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.unionInPlace(rhs)
}

public func |=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.unionInPlace(rhs)
}

public func &=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.intersectInPlace(rhs)
}

public func +=<T : Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.insert(rhs)
}

public func -=<T : Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.subtractInPlace(rhs)
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

// Implement Comparable (allows for "if set1 < set2 { … }")
public func <<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isStrictSubsetOf(rhs)
}

public func +<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.union(rhs)
}

public func -<T : Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>(lhs)
    for entry in rhs {
        newSet.remove(entry)
    }
    return newSet
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
    for entry in lhs {
        if rhs.contains(entry) {
            lhs.insert(entry)
        } else {
            lhs.remove(entry)
        }
    }
}

public func +=<T : Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.insert(rhs)
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

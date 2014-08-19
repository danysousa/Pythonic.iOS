// Python docs: https://docs.python.org/2/library/stdtypes.html#mapping-types-dict
//
// Most frequently used:
//   12 dict.get
//    4 dict.fromkeys
//    2 dict.keys
//    1 dict.iteritems
//    1 dict.has_key
//
// >>> filter(lambda s: not s.startswith("_"), dir({}))
//   clear: Implemented.
//   copy
//   fromkeys: Implemented (in Pythonic-test.swift to avoid compiler bug).
//   get: Implemented (in Pythonic-test.swift to avoid compiler bug).
//   has_key: Implemented as hasKey (in Pythonic-test.swift to avoid compiler bug).
//   items: Implemented (in Pythonic-test.swift to avoid compiler bug).
//   iteritems
//   iterkeys
//   itervalues
//   keys: Already in Swift (instance variable, not method).
//   pop: Implemented (in Pythonic-test.swift to avoid compiler bug).
//   popitem: Implemented (in Pythonic-test.swift to avoid compiler bug).
//   setdefault
//   update
//   values: Already in Swift (instance variable, not method).
//   viewitems
//   viewkeys
//   viewvalues

import Foundation

public typealias dict = Swift.Dictionary

extension Dictionary : BooleanType {
    public var boolValue: Bool {
        return len(self) != 0
    }
    // NOTE: get(…) implemented directly in Pythonic-test.swift to work around compiler bug.
    // NOTE: hasKey(…) implemented directly in Pythonic-test.swift to work around compiler bug.
    // NOTE: items() implemented directly in Pythonic-test.swift to work around compiler bug.
    // NOTE: pop(…) implemented directly in Pythonic-test.swift to work around compiler bug.
    // NOTE: popItem(…) implemented directly in Pythonic-test.swift to work around compiler bug.
}

public extension Dictionary {
    public mutating func clear() {
        self.removeAll()
    }
}

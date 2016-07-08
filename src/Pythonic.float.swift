// Python docs: https://docs.python.org/2/library/stdtypes.html
//
// >>> filter(lambda s: not s.startswith("_"), dir(1.1))
//   as_integer_ratio
//   conjugate
//   fromhex
//   hex
//   imag
//   is_integer: Implemented.
//   real

public typealias float = Swift.Double

extension Double: BooleanType {
    public var boolValue: Bool {
        return self != 0
    }
}

extension Double {
    public func isInteger() -> Bool {
        return math.floor(self) == self
    }

    public func is_integer() -> Bool {
        return self.isInteger()
    }
}

extension Float: BooleanType {
    public var boolValue: Bool {
        return self != 0
    }
}

extension Float {
    public func isInteger() -> Bool {
        return math.floor(Double(self)) == Double(self)
    }

    public func is_integer() -> Bool {
        return self.isInteger()
    }
}

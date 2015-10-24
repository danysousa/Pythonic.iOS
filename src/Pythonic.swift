// >>> filter(lambda s: re.match("^[a-z]", s), dir(__builtins__))
//   abs: Already in Swift.
//   all: Added.
//   any: Added.
//   apply
//   bin: Added.
//   bool: Added.
//   buffer
//   bytearray
//   bytes
//   callable
//   chr: Added.
//   classmethod
//   cmp: Added.
//   coerce
//   compile
//   complex
//   delattr
//   dict: Added.
//   divmod: Added.
//   enumerate: Already in Swift.
//   eval
//   execfile
//   file
//   filter
//   float
//   format
//   frozenset
//   getattr
//   globals
//   hasattr
//   hash
//   hex: Added.
//   id
//   input
//   int
//   intern
//   isinstance
//   issubclass
//   iter
//   len: Added.
//   list: Added.
//   locals
//   long
//   map
//   max: Added.
//   memoryview
//   min: Added.
//   next
//   object
//   oct: Added.
//   open: Added.
//   ord: Added.
//   pow: Added.
//   print
//   property
//   range: Added.
//   raw_input: Added.
//   reduce
//   repr
//   reversed
//   round: Added.
//   set: Added.
//   setattr
//   slice
//   sorted
//   staticmethod
//   str: Added.
//   sum: Added.
//   super
//   tuple
//   type
//   unichr
//   unicode
//   vars
//   xrange
//   zip: Added.

@exported import Foundation

infix operator ** {
    associativity right precedence 160
}

public func **(lhs: Double, rhs: Double) -> Double {
    return Darwin.pow(lhs, rhs)
}

public func all<R : SequenceType where R.Generator.Element : BooleanType>(iterable: R) -> Bool {
    for element in iterable {
        if !element {
            return false
        }
    }
    return true
}

public func any<R : SequenceType where R.Generator.Element : BooleanType>(iterable: R) -> Bool {
    for element in iterable {
        if element {
            return true
        }
    }
    return false
}

public func bin(x: Int) -> String {

    var i = x
    var ret = ""
    while i != 0 {
        if i % 2 == 0 {
            ret.insert("0", atIndex: ret.startIndex)
        } else {
            ret.insert("1", atIndex: ret.startIndex)
        }
        i = i >> 1
    }
    ret = "0b" + ret
    return ret

}

public func chr(i: Int) -> String {
    return String(UnicodeScalar(i))
}

public func cmp<T : Comparable>(x: T, _ y: T) -> Int {
    if x < y {
        return -1
    }
    if x > y {
        return 1
    }
    return 0
}

public func divmod(x: Double, _ y: Double) -> (Double, Double) {
    let l = (x - x % y) / y
    let r = x % y
    return (l, r)
}

public func divmod(x: Int, _ y: Int) -> (Int, Int) {
    let l = (x - x % y) / y
    let r = x % y
    return (l, r)
}

public func hex(i: Int) -> String {
    let o = String(format: "%x", i)
    return "0x" + o
}

public func len<C : CollectionType>(x: C) -> Int {
    return x.count as! Int
}

public func len(str: String) -> Int {
    return str.characters.count
}

// NOTE: This max(…) function is totally redundant since [Int] fulfills requirements of the generics
//       based max(…) function below. However, this version is needed to work around a compiler bug
//       which caused the compilation time to increase +5 seconds per call.
public func max(range: [Int]) -> Int {
    return range.maxElement()!
}

public func max<R : SequenceType where R.Generator.Element : Comparable>(range: R) -> R.Generator.Element {
    return range.maxElement()!
}

// NOTE: This min(…) function is totally redundant since [Int] fulfills requirements of the generics
//       based min(…) function below. However, this version is needed to work around a compiler bug
//       which caused the compilation time to increase +5 seconds per call.
public func min(range: [Int]) -> Int {
    return range.minElement()!
}

public func min<R : SequenceType where R.Generator.Element : Comparable>(range: R) -> R.Generator.Element {
    return range.minElement()!
}

public func oct(i: Int) -> String {
    let o = String(format: "%o", i)
    if o == "0" {
        return o
    }
    return "0" + o
}

public func open(path: String, _ mode: String = "") -> NSFileHandle {
    switch mode {
        case "r":
            return NSFileHandle(forReadingAtPath: path)!
        case "w":
            os.unlink(path)
            shutil.copyFile("/dev/null", path)
            return NSFileHandle(forWritingAtPath: path)!
        case "a":
            let fh = NSFileHandle(forWritingAtPath: path)!
            fh.seekToEndOfFile()
            return fh
        default:
            return NSFileHandle(forReadingAtPath: path)!
    }
}

public func ord(c: Character) -> Int {
    return ord(String(c))
}

public func ord(s: String) -> Int {
    return Int((s as NSString).characterAtIndex(0))
}

public func pow(x: Int, _ y: Int) -> Int {
    return Int(math.pow(Double(x), Double(y)))
}

public func range(stop: Int) -> [Int] {
    return range(0, stop)
}

public func range(start: Int, _ stop: Int, _ step: Int = 1) -> [Int] {
    if step <= 0 || start > stop {
        return [Int]()
    }
    return Array(start.stride(to: stop, by: step))
}

public func xrange(stop: Int) -> StrideTo<Int> {
    return xrange(0, stop)
}

public func xrange(start: Int, _ stop: Int, _ step: Int = 1) -> StrideTo<Int> {
    if step <= 0 || start > stop {
        return 0.stride(to: 0, by: 1)
    }
    return start.stride(to: stop, by: step)
}

public func raw_input(prompt: String) -> String {
    return rawInput(prompt)
}

public func rawInput(prompt: String) -> String {
    if prompt {
        // NOTE: Workaround for print(...) which appears not to flush properly.
        let nsPromptString = prompt as NSString
        if let nsPromptData = nsPromptString.dataUsingEncoding(NSUTF8StringEncoding) {
            let stdout = NSFileHandle.fileHandleWithStandardOutput()
            stdout.writeData(nsPromptData)
            stdout.synchronizeFile()
        }
    }
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    let data = stdin.availableData
    let inputString = NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    return inputString.rstrip()
}

public func raw_input() -> String {
    return rawInput()
}

public func rawInput() -> String {
    return rawInput("")
}

public func round(d: Float) -> Float {
    return Darwin.round(d)
}

public func sum(iterable: [Double], _ start: Double = 0) -> Double {
    return iterable.reduce(start, combine: { $0 + $1 })
}

public func sum(iterable: [Int], _ start: Int = 0) -> Int {
    return iterable.reduce(start, combine: { $0 + $1 })
}

public func zip<S1 : SequenceType, S2 : SequenceType>(s1: S1, s2: S2) -> [(S1.Generator.Element, S2.Generator.Element)] {
    return Array(Swift.zip(s1, s2))
}

extension Zip2Sequence {
    subscript(i: Int) -> (Stream1.Element, Stream2.Element) {
        return Array(self)[i]
    }
}

public typealias bool = Swift.Bool
public typealias long = Swift.Int
public typealias object = NSObject

extension Character : BooleanType {
    public var boolValue: Bool {
        return true
    }
}

extension NSObject : BooleanType {
    public var boolValue: Bool {
        return true
    }
}

// Comparison of 2-part tuples
public func ==<T : Equatable>(tuple1:(T, T),tuple2:(T, T)) -> Bool {
    return tuple1.0 == tuple2.0 && tuple1.1 == tuple2.1
}

// Comparison of 3-part tuples
public func ==<T : Equatable>(tuple1:(T, T, T),tuple2:(T, T, T)) -> Bool {
    return tuple1.0 == tuple2.0 && tuple1.1 == tuple2.1 && tuple1.2 == tuple2.2
}

// TODO: Python functions to implement
// ===================================
//
// Candidates for extensions:
//
// SWIFT              FOUNDATION/OBJC       PYTHON
// =====              ===============       ======
// -                  NSDate                datetime/datetime.datetime
// -                  NSFileHandle          open
// -                  NSMutableSet          set
// -                  NSRegularExpression   re
// Any                -                     -
// AnyClass           Class                 -
// AnyObject          id                    -
// Array              NSArray               list
// Bool               BOOL                  bool
// Character          -                     -
// Dictionary         NSMutableDictionary   dict
// Double             -                     -
// Float              -                     float
// Int                NSInteger             int
// NilType/Optional   nil                   None
// Range              NSRange               range/xrange
// String             NSString              str
//
// Functions listed on https://docs.python.org/2/library/functions.html not yet implemented:
// basestring()¶                            This abstract type is the superclass for str and unicode.
// bin(x)¶                                  Convert an integer number to a binary string.
// bytearray([source[, encoding[, err]]])¶  Return a new array of bytes. The bytearray type is a mutable sequence of integers in the range 0 <= x < 256.
// callable(object)¶                        Return True if the object argument appears callable, False if not.
// classmethod(function)¶                   Return a class method for function.
// compile(source, filename, …)¶            Compile the source into a code or AST object.
// complex([real[, imag]])¶                 Create a complex number with the value real + imag*j or convert a string or number to a complex number.
// delattr(object, name)¶                   This is a relative of setattr(). The arguments are an object and a string.
// dir([object])¶                           Without arguments, return the list of names in the current local scope. With an argument, attempt to return a list of valid attributes for that object.
// divmod(a, b)¶                            Take two (non complex) numbers as arguments and return a pair of numbers consisting of their quotient and remainder when using long division.
// enumerate(sequence, start=0)¶            Return an enumerate object. sequence must be a sequence, an iterator, or some other object which supports iteration.
// eval(expression[, globals[, locals]])¶   The arguments are a Unicode or Latin-1 encoded string and optional globals and locals.
// execfile(filename[, globals[, locals]])¶ This function is similar to the exec statement, but parses a file instead of a string.
// file(name[, mode[, buffering]])¶         Constructor function for the file type, described further in section File Objects. The constructor’s arguments are the same as those of the open() built-in function described below.
// filter(function, iterable)¶              Construct a list from those elements of iterable for which function returns true. iterable may be either a sequence, a container which supports iteration, or an iterator.
// format(value[, format_spec])¶            Convert a value to a “formatted” representation, as controlled by format_spec.
// frozenset([iterable])¶                   Return a new frozenset object, optionally with elements taken from iterable.
// getattr(object, name[, default])¶        Return the value of the named attribute of object. name must be a string.
// globals()¶                               Return a dictionary representing the current global symbol table.
// hash(object)¶                            Return the hash value of the object (if it has one). Hash values are integers.
// help([object])¶                          Invoke the built-in help system. (This function is intended for interactive use.)
// id(object)¶                              Return the “identity” of an object. This is an integer (or long integer) which is guaranteed to be unique and constant for this object during its lifetime.
// input([prompt])¶                         Equivalent to eval(raw_input(prompt)).
// isinstance(object, classinfo)¶           Return true if the object argument is an instance of the classinfo argument, or of a (direct, indirect or virtual) subclass thereof.
// issubclass(class, classinfo)¶            Return true if class is a subclass (direct, indirect or virtual) of classinfo.
// iter(o[, sentinel])¶                     Return an iterator object. The first argument is interpreted very differently depending on the presence of the second argument.
// map(function, iterable, ...)¶            Apply function to every item of iterable and return a list of the results.
// memoryview(obj)¶                         Return a “memory view” object created from the given argument.
// next(iterator[, default])¶               Retrieve the next item from the iterator by calling its next() method.
// object()¶                                Return a new featureless object. object is a base for all new style classes.
// property([fget[, fset[, fdel[, doc]]]])¶ Return a property attribute for new-style classes (classes that derive from object).
// reduce(function, iterable[, init])¶      Apply function of two arguments cumulatively to the items of iterable, from left to right, so as to reduce the iterable to a single value.
// reload(module)¶                          Reload a previously imported module. The argument must be a module object, so it must have been successfully imported before.
// repr(object)¶                            Return a string containing a printable representation of an object.
// reversed(seq)¶                           Return a reverse iterator. seq must be an object which has a __reversed__() method or supports the sequence protocol (the __len__() method and the __getitem__() method with integer arguments starting at 0).
// set([iterable])¶                         Return a new set object, optionally with elements taken from iterable. set is a built-in class.
// setattr(object, name, value)¶            This is the counterpart of getattr(). The arguments are an object, a string and an arbitrary value.
// slice(stop)/slice(start, stop[, step])¶  Return a slice object representing the set of indices specified by range(start, stop, step). The start and step arguments default to None.
// sorted(iterable[, cmp[, key[, rev]]])¶   Return a new sorted list from the items in iterable.
// staticmethod(function)¶                  Return a static method for function.
// super(type[, object-or-type])¶           Return a proxy object that delegates method calls to a parent or sibling class of type.
// tuple([iterable])¶                       Return a tuple whose items are the same and in the same order as iterable‘s items. iterable may be a sequence, a container that supports iteration, or an iterator object.
// type(object)/type(name, bases, dict)¶    With one argument, return the type of an object. The return value is a type object.
// unichr(i)¶                               Return the Unicode string of one character whose Unicode code is the integer i.
// unicode(o='')/unicode(o[, enc[, err]])¶  Return the Unicode string version of object using one of the following modes …
// vars([object])¶                          Return the __dict__ attribute for a module, class, instance, or any other object with a __dict__ attribute.
// xrange(stop)/xrange(start, stop[, st])¶  This function is very similar to range(), but returns an xrange object instead of a list.
//
// https://docs.python.org/2/library/stdtypes.html
// seq [str, unicode, list, tuple, bytearray, buffer, xrange]
// x in s
// x not in s
// s + t
// s * n
// s[i]
// s[i:j]
// s[i:j:k]
// len(s)
// min(s)
// max(s)
// s.index(x)
// s.count(x)
// Sequence types also support comparisons. In particular, tuples and lists are compared lexicographically by comparing corresponding elements.
// This means that to compare equal, every element must compare equal and the two sequences must be of the same type and have the same length.
//
// Mutable sequence types:
// s[i] = x
// s[i:j] = t
// del s[i:j]
// s[i:j:k] = t
// del s[i:j:k]
// s.append(x)
// s.extend(x)
// s.count(x)
// s.index(x[, i[, j]])
// s.insert(i, x)
// s.pop([i])
// s.remove(x)
// s.reverse()
// s.sort([cmp[, key[, reverse]]])
//
// https://docs.python.org/2/library/stdtypes.html
// Dictionary methods
// len(d)
// d[key]
// d[key] = value
// del d[key]
// key in d
// key not in d
// iter(d)
// clear()
// copy()
// fromkeys(seq[, value])
// get(key[, default])
// has_key(key)
// items()
// iteritems()
// iterkeys()
// itervalues()
// keys()
// pop(key[, default])
// popitem()
// setdefault(key[, default])
// update([other])
// values()
// viewitems()
// viewkeys()
// viewvalues()

public func %<A0 : CVarArgType>(lhs: String, rhs: (A0)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs)
}

public func %<A0 : CVarArgType, A1 : CVarArgType>(lhs: String, rhs: (A0, A1)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1)
}

public func %<A0 : CVarArgType, A1 : CVarArgType, A2 : CVarArgType>(lhs: String, rhs: (A0, A1, A2)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1, rhs.2)
}

public func %<A0 : CVarArgType, A1 : CVarArgType, A2 : CVarArgType, A3 : CVarArgType>(lhs: String, rhs: (A0, A1, A2, A3)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1, rhs.2, rhs.3)
}

public func %<A0 : CVarArgType, A1 : CVarArgType, A2 : CVarArgType, A3 : CVarArgType, A4 : CVarArgType>(lhs: String, rhs: (A0, A1, A2, A3, A4)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1, rhs.2, rhs.3, rhs.4)
}

public func %<A0 : CVarArgType, A1 : CVarArgType, A2 : CVarArgType, A3 : CVarArgType, A4 : CVarArgType, A5 : CVarArgType>(lhs: String, rhs: (A0, A1, A2, A3, A4, A5)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1, rhs.2, rhs.3, rhs.4, rhs.5)
}

public func %<A0 : CVarArgType, A1 : CVarArgType, A2 : CVarArgType, A3 : CVarArgType, A4 : CVarArgType, A5 : CVarArgType, A6 : CVarArgType>(lhs: String, rhs: (A0, A1, A2, A3, A4, A5, A6)) -> String {
    return String(format: lhs.replace("%s", "%@"), rhs.0, rhs.1, rhs.2, rhs.3, rhs.4, rhs.5, rhs.6)
}

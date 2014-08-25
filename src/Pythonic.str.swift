// Python docs: https://docs.python.org/2/library/string.html
// also: https://docs.python.org/2/library/stdtypes.html#string-methods
//
// Most frequently used:
//   19 str.replace
//    9 str.split
//    4 str.join
//    2 str.startswith
//    2 str.lower
//    1 str.upper
//    1 str.strip
//    1 str.decode
//
// >>> filter(lambda s: not s.startswith("_"), dir(""))
//   capitalize: Added.
//   center: Added.
//   count: Added.
//   decode: TODO.
//   encode: TODO.
//   endswith: Added.
//   expandtabs: Added.
//   find: Added.
//   format: TODO.
//   index: Added.
//   isalnum: Added.
//   isalpha: Added.
//   isdigit: Added.
//   islower: Added.
//   isspace: Added.
//   istitle: Added.
//   isupper: Added.
//   join: Already in Swift.
//   ljust: Added.
//   lower: Added.
//   lstrip: Added.
//   partition: Added.
//   replace: Added.
//   rfind: TODO.
//   rindex: TODO.
//   rjust: Added.
//   rpartition: TODO.
//   rsplit: Added.
//   rstrip: Added.
//   split: Added.
//   splitlines: Added.
//   startswith: Added.
//   strip: Added.
//   swapcase: Added.
//   title: Added.
//   translate: TODO.
//   upper: Added.
//   zfill: Added.

import Foundation

public typealias str = Swift.String

extension String : BooleanType {
    public var boolValue: Bool {
        return len(self) != 0
    }

    public func count(c: Character) -> Int {
        var counter = 0
        for ch in self {
            if ch == c {
                counter += 1
            }
        }
        return counter
    }

    public func capitalize() -> String {
        if len(self) == 0 {
            return self
        }
        return self[0].upper() + self[1..<len(self)].lower()
    }

    public func endsWith(suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }

    public func endswith(suffix: String) -> Bool {
        return self.endsWith(suffix)
    }

    public func lower() -> String {
        return self.lowercaseString
    }

    public func replace(replaceOldString: String, _ withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(replaceOldString, withString: withString)
    }

    public func split() -> [String] {
        var strings = [String]()
        for s in re.split(WHITESPACE_REGEXP, self) {
            if s {
                strings += [s]
            }
        }
        return strings
    }

    // TODO: More arguments. string.split(s[, sep[, maxsplit]])¶
    public func split(sep: String) -> [String] {
        return self.componentsSeparatedByString(sep)
    }

    public func splitlines() -> [String] {
        var normalized = self.replace("\r\n", "\n").replace("\r", "\n")
        normalized = re.sub("\n$", "", normalized)
        return re.split("\n", normalized)
    }

    public func startsWith(prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }

    public func startswith(prefix: String) -> Bool {
        return self.startsWith(prefix)
    }

    private var HEX_SET: Set<String> {
        return DIGITS_SET + Set(["a", "A", "b", "B", "c", "C", "d", "D", "e", "E", "f", "F"])
    }

    private func isComposedOnlyOfCharacterSet(characterSet: Set<String>) -> Bool {
        if self == "" {
            return false
        }
        for ch in self {
            if !characterSet.contains(String(ch)) {
                return false
            }
        }
        return true
    }

    private var WHITESPACE_SET: Set<String> {
        return Set(["\t", "\n", "\r", "\u{11}", "\u{12}", " "])
    }

    public func isSpace() -> Bool {
        return self.isComposedOnlyOfCharacterSet(WHITESPACE_SET)
    }

    public func isspace() -> Bool {
        return self.isSpace()
    }

    private var ASCII_LOWERCASE_SET: Set<String> {
        return Set(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"])
    }

    public func isLower() -> Bool {
        return self.isComposedOnlyOfCharacterSet(ASCII_LOWERCASE_SET)
    }

    public func islower() -> Bool {
        return self.isLower()
    }

    private var ASCII_UPPERCASE_SET: Set<String> {
        return Set(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"])
    }

    public func isUpper() -> Bool {
        return self.isComposedOnlyOfCharacterSet(ASCII_UPPERCASE_SET)
    }

    public func isupper() -> Bool {
        return self.isUpper()
    }

    private var DIGITS_SET: Set<String> {
        return Set(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
    }

    public func isDigit() -> Bool {
        return self.isComposedOnlyOfCharacterSet(DIGITS_SET)
    }

    public func isdigit() -> Bool {
        return self.isDigit()
    }

    private var ASCII_ALPHA_SET: Set<String> {
        return ASCII_UPPERCASE_SET + ASCII_LOWERCASE_SET
    }

    public func isAlpha() -> Bool {
        return self.isComposedOnlyOfCharacterSet(ASCII_ALPHA_SET)
    }

    public func isalpha() -> Bool {
        return self.isAlpha()
    }

    private var ASCII_ALPHANUMERIC_SET: Set<String> {
        return ASCII_ALPHA_SET + DIGITS_SET
    }

    public func isAlnum() -> Bool {
        return self.isComposedOnlyOfCharacterSet(ASCII_ALPHANUMERIC_SET)
    }

    public func isalnum() -> Bool {
        return self.isAlnum()
    }

    public func isTitle() -> Bool {
        return self == self.title()
    }

    public func istitle() -> Bool {
        return self.isTitle()
    }

    public func swapCase() -> String {
        var returnString = ""
        for ch in self {
            var s = String(ch)
            if s.isLower() {
                returnString += s.upper()
            } else if s.isUpper() {
                returnString += s.lower()
            } else {
                returnString += s
            }
        }
        return returnString
    }

    public func swapcase() -> String {
        return self.swapCase()
    }

    private var WHITESPACE_REGEXP: String {
        return "[\t\n\r\u{11}\u{12} ]"
    }

    public func lstrip() -> String {
        return re.sub("^" + self.WHITESPACE_REGEXP + "+", "", self)
    }

    public func rstrip() -> String {
        return re.sub(self.WHITESPACE_REGEXP + "+$", "", self)
    }

    public func strip() -> String {
        return self.lstrip().rstrip()
    }

    // NOTE: Not equivalent to Python, but better.
    public func title() -> String {
        return self.capitalizedString
    }

    public func upper() -> String {
        return self.uppercaseString
    }

    private func _sliceIndexes(arg1: Int?, _ arg2: Int?) -> (Int, Int) {
        let len = countElements(self)
        var (start, end) = (0, len)
        if let arg1 = arg1 {
            if arg1 < 0 {
                start = max(len + arg1, 0)
            } else {
                start = min(arg1, len)
            }
        }
        if let arg2 = arg2 {
            if arg2 < 0 {
                end = max(len + arg2, 0)
            } else {
                end = min(arg2, len)
            }
        }
        if start > end {
            return (0, 0)
        }
        return (start, end)
    }
    
    /// Get a substring using Pythonic string indexing.
    ///
    /// Usage:
    ///
    /// * Python: str[2:4] -> Swift: str[(2, 4)]
    /// * Python: str[2:]  -> Swift: str[(2, nil)]
    /// * Python: str[:2]  -> Swift: str[(nil, 2)]
    public subscript (args: (Int?, Int?)) -> String {
        let (arg1: Int?, arg2: Int?) = args
        let (start, end) = _sliceIndexes(arg1, arg2)
        return self[start..<end]
    }
    
    /// Get a single-character string by Int index.
    public subscript (var index: Int) -> String {
        if index < 0 {
            index += countElements(self)
        }
        return self[index...index]
    }

    /// Get a substring using an integer range.
    ///
    /// Usage:
    ///
    /// * str[2..<4]
    /// * str[2...4]
    public subscript (range: Range<Int>) -> String {
        let start = Swift.advance(self.startIndex, range.startIndex)
        let end = Swift.advance(start, range.endIndex - range.startIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }

    /// Split the string at the first occurrence of sep, and return a 3-tuple containing the part before the separator, the separator itself, and the part after the separator. If the separator is not found, return a 3-tuple containing the string itself, followed by two empty strings.
    public func partition(separator: String) -> (String, String, String) {
        if let separatorRange = self.rangeOfString(separator) {
            if !separatorRange.isEmpty {
                let firstpart = self[self.startIndex ..< separatorRange.startIndex]
                let secondpart = self[separatorRange.endIndex ..< self.endIndex]
                return (firstpart, separator, secondpart)
            }
        }
        return (self,"","")
    }

    // justification
    public func ljust(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        if length >= width { return self }
        return self + String(count: width - length, repeatedValue: fillchar)
    }

    public func rjust(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        if length >= width { return self }
        return String(count: width - length, repeatedValue: fillchar) + self
    }

    public func center(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        let oddShift = length % 2 == 1 ? 0.5 : 0.0 // Python is weird about string centering
        let left = Int((Double(width) + Double(length)) / 2.0 + oddShift)
        return self.ljust(left, fillchar).rjust(width, fillchar)
    }

    public func expandTabs(tabSize: Int) -> String {
        return self.replace("\t", " " * tabSize)
    }

    public func expandTabs() -> String {
        return self.expandTabs(8)
    }

    public func expandtabs(tabSize: Int) -> String {
        return self.expandTabs(tabSize)
    }

    public func expandtabs() -> String {
        return self.expandTabs()
    }

    // TODO: Cannot use Foundation String functions here, since string length
    //       according to Foundation can differ from string length according
    //       to Swift.
    public func find(sub: String) -> Int {
        let subArr = Array(sub)
        if subArr.count == 0 {
            return 0
        }
        let stringArr = Array(self)
        if subArr.count > stringArr.count {
            return -1
        }
        for i in 0..<stringArr.count - subArr.count + 1 {
            if stringArr[i] == subArr[0] {
                let readAhead = stringArr[i..<i + subArr.count]
                if equal(readAhead, subArr) {
                    return i
                }
            }
        }
        return -1
    }

    public func index(sub: String) -> Int {
        return self.find(sub)
    }

    public func zfill(length: Int) -> String {
        return "0" * (length - len(self)) + self
    }

    // Python: if "foo" in "foobar": …
    // Pythonic.swift: if "foo".in(foobar) { … }
    public func `in`(s: String) -> Bool {
        if !self {
            return true
        }
        return (s as NSString).rangeOfString(self).length != 0
    }
}

public func *(lhs: Int, rhs: String) -> String {
    if lhs < 0 {
        return ""
    }
    var ret = ""
    for _ in 0..<lhs {
        ret += rhs
    }
    return ret
}

public func *(lhs: String, rhs: Int) -> String {
    return rhs * lhs
}

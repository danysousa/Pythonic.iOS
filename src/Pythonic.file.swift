// Python docs: https://docs.python.org/2/library/stdtypes.html
//
// Most frequently used:
//   15 file.close
//    9 file.name
//    8 file.readline
//    7 file.write
//    2 file.read
//    1 file.writelines
//    1 file.readlines
//    1 file.fileno
//
// >>> filter(lambda s: not s.startswith("_"), dir(open("/tmp/foo")))
//   close: TODO.
//   closed
//   encoding
//   errors
//   fileno
//   flush: TODO.
//   isatty
//   mode
//   name
//   newlines
//   next
//   read
//   readinto
//   readline
//   readlines
//   seek
//   softspace
//   tell
//   truncate
//   write: TODO.
//   writelines
//   xreadlines

import Foundation

public typealias file = NSFileHandle

public extension NSFileHandle {
    public func read() -> String {
        let data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    }

    public func readLines() -> [String] {
        return self.read().strip().split("\n")
    }

    public func readlines() -> [String] {
        return self.readLines()
    }

    public func close() {
        self.closeFile()
    }

    public func write(s: String) {
        if let data = s.dataUsingEncoding(NSUTF8StringEncoding) {
            self.writeData(data)
        }
    }
}

extension NSFileHandle: SequenceType {
    public func availableText () -> String? {
        let data: NSData = self.availableData
        if data.length == 0 {
            return nil
        } else {
            return String(data: data, encoding: NSUTF8StringEncoding)
        }
    }

    public func generate() -> _FileHandle_Generator {
        return _FileHandle_Generator(fileHandle: self)
    }
}

public class _FileHandle_Generator: GeneratorType {
    private let fileHandle: NSFileHandle
    private var cache = ""

    private init(fileHandle: NSFileHandle) {
        self.fileHandle = fileHandle
    }

    public func next() -> String? {
        let (nextLine, returnedSeparator, remainder) = cache.partition("\n")
        cache = remainder
        let newLineWasFound = returnedSeparator != ""
        if newLineWasFound {
            return nextLine
        }
        if let newCache = fileHandle.availableText() {
            cache = nextLine + newCache
            return next()
        }
        return nextLine == "" ? nil : nextLine
    }
}

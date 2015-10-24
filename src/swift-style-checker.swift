#!/usr/bin/env xcrun swift -I .

// Usage: swift-style-checker.swift [FILE...]
//
// This is work in progress. Feel free to add additional checks! :-)

import Pythonic

if len(sys.argv) <= 1 {
    print("Usage: swift-style-checker.swift [FILE...]")
    sys.exit(0)
}

func countLeadingSpaces(s: String) -> Int {
    for (i, ch) in s.characters.enumerate() {
        if ch != " " {
            return i
        }
    }
    return 0
}

func checkFile(fileName: String) -> Bool {
    var passed = true
    for (lineNumber, originalLine) in open(fileName).enumerate() {
        let numberOfLeadingSpaces = countLeadingSpaces(originalLine)
        let lineWithoutLeadingSpaces = originalLine[numberOfLeadingSpaces..<len(originalLine)]
        if re.search("\t", originalLine) {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) contains an raw/unquoted tab (\\t):")
            print(originalLine.replace("\t", "\\t"))
            passed = false
        } else if numberOfLeadingSpaces % 4 != 0 {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) has indentation of \(numberOfLeadingSpaces) spaces which is not a multiple of four (4):")
            print(originalLine)
            passed = false
        } else if lineWithoutLeadingSpaces != lineWithoutLeadingSpaces.lstrip() {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) contains leading whitespace:")
            print(originalLine)
            passed = false
        } else if lineWithoutLeadingSpaces != lineWithoutLeadingSpaces.rstrip() {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) contains trailing whitespace:")
            print(originalLine)
            passed = false
        } else if re.search(";$", originalLine) {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) ends with a redundant \";\":")
            print(originalLine)
            passed = false
        } else if re.search("^[^\"]+[\\[(][a-z0-9]+,[a-z0-9]", originalLine) || re.search("^[^\"]*\"[^\"]*\"[^\"]*[\\[(][a-z0-9]+,[a-z0-9]", originalLine) {
            print("ERROR – Line #\(lineNumber + 1) of \(fileName) has variables listed without being separated by space (\"foo,bar\" instead of \"foo, bar\"):")
            print(originalLine)
            passed = false
        }
    }
    return passed
}

var hasErrors = false
let fileNames = sys.argv[1..<len(sys.argv)]
for fileName in fileNames {
    if !checkFile(fileName) {
        hasErrors = true
    }
}

if hasErrors {
    sys.exit(-1)
}

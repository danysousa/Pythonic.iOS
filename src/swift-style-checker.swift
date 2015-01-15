#!/usr/bin/env xcrun swift -I .

// Usage: swift-style-checker.swift [FILE...]
//
// This is work in progress. Feel free to add additional checks! :-)

import Pythonic

if len(sys.argv) <= 1 {
    println("Usage: swift-style-checker.swift [FILE...]")
    sys.exit(0)
}

func countLeadingSpaces(s: String) -> Int {
    for (i, ch) in enumerate(s) {
        if ch != " " {
            return i
        }
    }
    return 0
}

func checkFile(fileName: String) -> Bool {
    var passed = true
    for (lineNumber, originalLine) in enumerate(open(fileName)) {
        let numberOfLeadingSpaces = countLeadingSpaces(originalLine)
        let lineWithoutLeadingSpaces = originalLine[numberOfLeadingSpaces..<len(originalLine)]
        if re.search("\t", originalLine) {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) contains an raw/unquoted tab (\\t):")
            println(originalLine.replace("\t", "\\t"))
            passed = false
        } else if numberOfLeadingSpaces % 4 != 0 {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) has indentation of \(numberOfLeadingSpaces) spaces which is not a multiple of four (4):")
            println(originalLine)
            passed = false
        } else if lineWithoutLeadingSpaces != lineWithoutLeadingSpaces.lstrip() {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) contains leading whitespace:")
            println(originalLine)
            passed = false
        } else if lineWithoutLeadingSpaces != lineWithoutLeadingSpaces.rstrip() {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) contains trailing whitespace:")
            println(originalLine)
            passed = false
        } else if re.search(";$", originalLine) {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) ends with a redundant \";\":")
            println(originalLine)
            passed = false
        } else if re.search("^[^\"]+[\\[(][a-z0-9]+,[a-z0-9]", originalLine) || re.search("^[^\"]*\"[^\"]*\"[^\"]*[\\[(][a-z0-9]+,[a-z0-9]", originalLine) {
            println("ERROR – Line #\(lineNumber + 1) of \(fileName) has variables listed without being separated by space (\"foo,bar\" instead of \"foo, bar\"):")
            println(originalLine)
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

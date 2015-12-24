### Pythonic.swift

Pythonic.swift is a Swift library implementating selected parts of [Python's standard library](https://docs.python.org/2/library/) and making them available to your Swift code.

```import Pythonic``` allows you to write Python flavored code such as:

```swift
#!/usr/bin/env swift -I .

import Pythonic

if re.search("^foo", "foobar") {
    print("ok!")
}

if any(["foo", "bar", "zonk"]) {
    print(chr(ord("a"))) // a
}

var strings = ["foo", "bar"]
print(":".join(strings)) // foo:bar
if strings {
    print(strings[0]) // foo
}
if len(strings) == 2 {
    print(strings[1].upper()) // BAR
    print(strings[1].split("a")) // ["b", "r"]
}

var greeting = "   hello pythonista   "
if greeting.strip().startswith("hello") {
    print(greeting.strip().title()) // Hello Pythonista
}

var numbers = [1, 2, 3, 4, 5]
print(sum(numbers)) // 15
print(max(numbers)) // 5
```

See the the test suite <a href="https://github.com/practicalswift/pythonic-swift/blob/master/src/Pythonic-test.swift">Pythonic-test.swift</a> and the <a href="https://github.com/practicalswift/Pythonic.swift/blob/master/src/swift-style-checker.swift">Swift syntax checker</a> for more examples. Questions? Get in touch on Twitter <a href="https://twitter.com/practicalswift">@practicalswift</a>.

### Getting started

```shell
git clone https://github.com/practicalswift/Pythonic.swift.git
cd Pythonic.swift/src/
make
make test
mkdir my-pythonic-app/
cd my-pythonic-app/
cp ../Pythonic.swiftdoc ../Pythonic.swiftmodule ../libPythonic.dylib .
cat << EOF > my_pythonic_app.swift
#!/usr/bin/env swift -I .

import Pythonic

assert("  hello  ".strip() == "hello")
println("This feels really.. Pythonic!")
EOF
chmod +x my_pythonic_app.swift
./my_pythonic_app.swift
```

### Contributing

Code contributions are more than welcome! This is the quick guide to contributing:

1. Fork the project
2. Implement function `foo` from the Python standard library
3. Add a test case for `foo` in `Pythonic-test.swift`
4. Make sure the test case passes in both Python and Swift by running `make test`
5. Submit a pull request
6. Repeat until we're done :-)

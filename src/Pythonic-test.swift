#!/usr/bin/env xcrun swift -I .

import Pythonic

// ** (power operator)
assert(1 + 2**2 + 2 == 7)
assert(1 + 2.0**2.0 + 2 == 7)
assert(1**1 + 2.0**2.0 + 2 == 7)
assert(2 * 2 ** 2 * 3 ** 2 * 3 ** 3 == 1944)
assert(2**2 == 4)
assert(2.0**2.0 == 4)

// abs
assert(abs(-0.1) == 0.1)
assert(abs(-1) == 1)

// all
assert(!all(["", "bar", "baz"]))
assert(!all([false, false, false]))
assert(!all([false, false, true]))
assert(all(["foo", "bar", "baz"]))
assert(all([0.0001, 0.0001]))
assert(all([true, true, true]))

// any
assert(!any([0, 0]))
assert(!any([false, false, false]))
assert(any(["", "foo", "bar", "baz"]))
assert(any([0.1, 0]))
assert(any([false, false, true]))

// bin
assert(bin(2) == "0b10")
assert(bin(7) == "0b111")
assert(bin(1024) == "0b10000000000")

// bool
assert(!bool(""))
assert(!bool(0))
assert(bool("foo"))
assert(bool(1))
assert(bool([1]))
// assert(!bool(set([]))) // error: could not find an overload for 'assert' that accepts the supplied arguments

// chr
assert(chr(97) == "a")
assert(chr(ord("b")) == "b")
assert(ord(chr(255)) == 255)

// cmp
assert(cmp("bar", "bar") == 0)
assert(cmp("bar", "foo") == -1)
assert(cmp("foo", "bar") == 1)
assert(cmp(0, 0) == 0)
assert(cmp(0, 1) == -1)
assert(cmp(1, 0) == 1)
// assert(cmp([1, 2, 3, 100], [2, 3, 4, 5]) == -1) – assertion fails

// double (truthness)
assert(bool(0.00000001))
assert(bool(1.0))
assert(!bool(0.0))

// double.is_integer/isInteger
assert(!0.000000000001.is_integer())
assert(!1.1.is_integer())
assert(1.0.is_integer())

// file
// TODO: Missing test.

// float
assert(!bool(float(0.0)))
assert(bool(float(0 + 0.0001)))
assert(bool(float(0.00000001)))
assert(bool(float(1.0)))

// float.is_integer
assert(!float(1.1).is_integer())
assert(float(1.0).is_integer())
assert(float(100).is_integer())

// hex
assert(hex(0) == "0x0")
assert(hex(1) == "0x1")
assert(hex(10) == "0xa")
assert(hex(100) == "0x64")
assert(hex(1000) == "0x3e8")
assert(hex(10000000) == "0x989680")

// int
assert(int(1.1) == 1)
assert(int(9.9) == 9)

// int (truthness)
assert(bool(1))
assert(!bool(0))

// json
assert(json.dumps([1, 2, 3]).replace("\n", "").replace(" ", "") == "[1,2,3]")

// len
assert(len("") == 0)
assert(len("\t") == 1)
assert(len("foo") == 3)
assert(len(["foo", "bar", "baz"]) == 3)
assert(len(["foo", "bar"]) == 2)
assert(len(["foo"]) == 1)

// list
assert(list([1, 2, 3]) == [1, 2, 3])
// assert(list([1, 2, 3]).count(1) == 1)

// list (truthness)
assert(bool([1, 2, 3]))
assert(bool([1, 2]))
assert(bool([1]))

// list(set)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(0) == 0)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(1) == 1)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(2) == 1)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(3) == 1)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(4) == 1)
// assert(list(set([1, 2, 3, 1, 2, 3, 4])).count(5) == 0)

// list.count
// assert([1, 2, 2, 3, 3, 3].count(1) == 1)
// assert([1, 2, 2, 3, 3, 3].count(2) == 2)
// assert([1, 2, 2, 3, 3, 3].count(3) == 3)
// assert([1, 2, 3].count(4) == 0)

// list.index
// assert(["foo", "bar", "baz"].index("baz") == 2)
// assert([1, 2, 3].index(3) == 2)
// assert(list(["a", "b", "c"]).index("b") == 1)

// literals
assert(0b0 == 0)
assert(0b111111111111111111111111111111111111111111111111111111111111111 == 9223372036854775807)
assert(0o00 == 0)
assert(0o10 == 8)
assert(0o11 == 9)
assert(0x00 == 0)
assert(0xff == 255)
assert(1.25e-2 == 0.0125)
assert(1.25e2 == 125)

// long
assert(long(1.1) == 1)

// math.acos
assert(math.acos(-1) == math.pi)

// math.asin
assert(math.asin(1) == math.pi / 2)

// math.atan
assert(math.atan(1) == math.pi / 4)

// math.cos
assert(math.cos(math.pi) == -1)

// math.degrees
assert(math.degrees(math.pi) == 180)

// math.factorial
assert(math.factorial(0) == 1)
assert(math.factorial(20) == 2432902008176640000)

// math.pow
assert(math.pow(2, 2) == 4)
assert(math.pow(2.0, 2.0) == 4.0)

// math.radians
assert(math.radians(270) == math.pi * 1.5)

// math.sin
assert(math.sin(math.pi / 2) == 1)

// math.sqrt
assert(math.sqrt(9) == 3)

// math.tan
// Python returns 0.999... for tan(π / 4)
assert(math.tan(math.pi / 4) <= 1)
assert(math.tan(math.pi / 4) > 0.9999999)

// max
assert(max(1, 2) == 2)
assert(max(1, 2, 3) == 3)
assert(max([1, 2, 3]) == 3)
assert(max([1, 2]) == 2)

// min
assert(min(1, 2) == 1)
assert(min(1, 2, 3) == 1)
assert(min([1, 2, 3]) == 1)
assert(min([1, 2]) == 1)

// object
assert(bool(object()))

// oct
assert(oct(0) == "0")
assert(oct(1) == "01")
assert(oct(10) == "012")
assert(oct(100) == "0144")
assert(oct(1000) == "01750")
// assert(oct(100000000000) == "01351035564000") – assertion fails

// open
assert(open("Pythonic-test.txt").read().splitlines()[2] == "This test file is being read")

// ord
assert(ord("a") == 97)
assert(ord(chr(98)) == 98)

// os.getcwd()
assert(bool(os.getcwd()))

// os.path.exists
assert(!os.path.exists("/tmp.foo/"))
assert(os.path.exists("/tmp/"))
assert(os.path.exists("Pythonic-test.txt"))

// os.path.join
assert(os.path.join("a", "b", "c") == "a/b/c")
assert(os.path.join("/a", "b", "c") == "/a/b/c")

// os.system (+ os.unlink + os.path.exists)
os.unlink("/tmp/pythonic-test.txt")
assert(os.system("/usr/bin/touch /tmp/pythonic-test.txt") == 0)
assert(os.path.exists("/tmp/pythonic-test.txt"))
os.unlink("/tmp/pythonic-test.txt")

// pow
assert(pow(2, 2) == 4)
assert(pow(2.0, 2.0) == 4.0)

// random.random
assert(random.random() < 1)

// random.randint
assert(random.randint(0, 10) <= 10)

// random.randrange
assert(random.randrange(0, 10) <= 9)

// range
assert(range(0) == [])
assert(range(0, 10, 2) == [0, 2, 4, 6, 8])
assert(range(0, 5, -1) == [])
assert(range(0, 50, 7) == [0, 7, 14, 21, 28, 35, 42, 49])
assert(range(1, 0) == [])
assert(range(1, 11) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
assert(range(10) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

// re.search
assert(!re.search("^bar", "foobarbaz"))
assert(!re.search("hello", "foobarbaz"))
assert(re.search("[\r\n]", "foo\rfoo").group(0) == "\r")
assert(re.search("\r\n", "foo\r\nfoo").group(0) == "\r\n")
assert(bool(re.search("^foo", "foobarbaz")))
assert(re.search("^foo", "foobarbaz").group(0) == "foo")
assert(bool(re.search("^foo.*baz$", "foobarbaz")))
assert(bool(re.search("foo", "foobarbaz")))
assert(bool(re.search("o", "foobarbaz")))

// re.match
assert(!re.match("^(.*)(([fo]+|[bar]+)|([bar]+|[baz+]))(.*)$", "foobarbazfoobarbaz").groups()[2])
assert(!re.match("^(.*)(([fo]+|[bar]+)|([bar]+|[baz+]))(.*)$", "foobarbazfoobarbaz").groups()[4])
assert(!re.match("o", "foobarbaz"))
assert(!re.search("zoo", "barfoobar"))
assert(len(re.match("^((foo|bar|baz)|foobar)*$", "foobarbazfoobarbaz").groups()) == 2)
assert(len(re.search("foo", "barfoobar").groups()) == 0)
assert(list(re.match("(.*) down (.*) on (.*)", "Bugger all down here on earth!").groups()) == ["Bugger all", "here", "earth!"])
assert(list(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").groups()) == ["Hello foo bar baz", "foo", "bar", "baz"])
assert(list(re.match("Hello[ \t]*(.*)world", "Hello     Python world").groups())[0] == "Python ")
assert(list(re.search("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()) == ["var", "tmp", "foo"])
assert(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").group(0) == "Hello foo bar baz")
assert(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").group(1) == "Hello foo bar baz")
assert(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").group(2) == "foo")
assert(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").group(3) == "bar")
assert(re.match("(Hello (foo) (bar) (baz))", "Hello foo bar baz").group(4) == "baz")
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[0] == "var")
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[1] == "tmp")
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[2] == "foo")
assert(re.match("Hello[ \t]*(.*)world", "Hello     Python world").group(0) == "Hello     Python world")
assert(re.match("Hello[ \t]*(.*)world", "Hello     Python world").group(1) == "Python ")
assert(re.match("^((foo|bar|baz)|foobar)*$", "foobarbazfoobarbaz").groups()[0] == "baz")
assert(re.match("^((foo|bar|baz)|foobar)*$", "foobarbazfoobarbaz").groups()[1] == "baz")
assert(re.match("^(.*)(([fo]+|[bar]+)|([bar]+|[baz+]))(.*)$", "foobarbazfoobarbaz").groups()[0] == "foobarbazfoobarba")
assert(re.match("^(.*)(([fo]+|[bar]+)|([bar]+|[baz+]))(.*)$", "foobarbazfoobarbaz").groups()[1] == "z")
assert(re.match("^(.*)(([fo]+|[bar]+)|([bar]+|[baz+]))(.*)$", "foobarbazfoobarbaz").groups()[3] == "z")
assert(bool(re.match("^foo", "foobarbaz")))
assert(bool(re.match("foo", "foobarbaz")))
assert(bool(re.search("foo", "barfoobar")))

// re.split
assert(re.split("/", "") == [""])
assert(re.split("/", "/") == ["", ""])
assert(re.split("/", "foo/") == ["foo", ""])
assert(re.split("/", "foo/bar") == ["foo", "bar"])
assert(re.split("/", "foo/bar/") == ["foo", "bar", ""])
assert(re.split("/", "foo/bar/baz") == ["foo", "bar", "baz"])
assert(re.split("/", "foo/bar/baz/") == ["foo", "bar", "baz", ""])
assert(re.split("[0-9]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e", "f", "z", "", "", "ee", "", "ch", "", "", "h", "", "fhh", "h", "ui", "", "", "sh", ""])
assert(re.split("[0-9]", "foo/bar/baz") == ["foo/bar/baz"])
assert(re.split("[0-9]", "foo/bar/baz/") == ["foo/bar/baz/"])
assert(re.split("[XY]+", "aXYbXYc") == ["a", "b", "c"])
assert(re.split("[\r\n]", "\r\n\t\t\r\n\r\t\n\r\r\n\n\t\t") == ["", "", "\t\t", "", "", "\t", "", "", "", "", "\t\t"])
assert(re.split("[\r\n]+", "foo\naw\tef\roa\r\nwef") == ["foo", "aw\tef", "oa", "wef"])
assert(re.split("[^a-z]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e", "f", "z", "", "", "ee", "", "ch", "", "", "h", "", "fhh", "h", "ui", "", "", "sh", ""])
assert(re.split("[a-z]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["", "8", "8", "888", "", "88", "", "838", "23", "", "", "3", "2", "", "388", "", "3"])
assert(re.split("a-z", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e8f8z888ee88ch838h23fhh3h2ui388sh3"])
assert(re.split("[^a-zA-Z0-9]", "foo bar baz") == ["foo", "bar", "baz"])
assert(re.split("\\s(?=\\w+:)", "foo:bar baz:foobar") == ["foo:bar", "baz:foobar"])
assert(re.split("[^a-z]", "foo1bar2baz3foo11bar22baz33foo111bar222baz333") == ["foo", "bar", "baz", "foo", "", "bar", "", "baz", "", "foo", "", "", "bar", "", "", "baz", "", "", ""])
assert(re.split("[^a-z]+", "foo12345foobar123baz1234567foobarbaz123456789bazbarfoo") == ["foo", "foobar", "baz", "foobarbaz", "bazbarfoo"])
assert(re.split("[^a-z]+", "foo12345foobar123baz1234567foobarbaz123456789bazbarfoo12345") == ["foo", "foobar", "baz", "foobarbaz", "bazbarfoo", ""])
assert(re.split("[^a-z]+", "12345foo12345foobar123baz1234567foobarbaz123456789bazbarfoo12345") == ["", "foo", "foobar", "baz", "foobarbaz", "bazbarfoo", ""])
assert(re.split("([^a-z]+)", "foo12345foobar123baz1234567foobarbaz123456789bazbarfoo") == ["foo", "12345", "foobar", "123", "baz", "1234567", "foobarbaz", "123456789", "bazbarfoo"])
assert(re.split("([^a-z]+)", "foo12345foobar123baz1234567foobarbaz123456789bazbarfoo12345") == ["foo", "12345", "foobar", "123", "baz", "1234567", "foobarbaz", "123456789", "bazbarfoo", "12345", ""])
assert(re.split("([^a-z]+)", "12345foo12345foobar123baz1234567foobarbaz123456789bazbarfoo12345") == ["", "12345", "foo", "12345", "foobar", "123", "baz", "1234567", "foobarbaz", "123456789", "bazbarfoo", "12345", ""])
assert(re.split("([^a-zA-Z0-9])", "foo bar baz") == ["foo", " ", "bar", " ", "baz"])
assert(re.split("(abc)", "abcfooabcfooabcfoo") == ["", "abc", "foo", "abc", "foo", "abc", "foo"])
assert(re.split("abc", "abcfooabcfooabcfoo") == ["", "foo", "foo", "foo"])
// assert(re.split("(a)b(c)", "abcfooabcfooabcfoo") == ["", "a", "c", "foo", "a", "c", "foo", "a", "c", "foo"]) // Failing edge case which is not Python compatible yet.

// re.sub
assert(re.sub("^foo", "bar", "foofoo") == "barfoo")
assert(re.sub("^zfoo", "bar", "foofoo") == "foofoo")
assert(re.sub("([^a-zA-Z0-9])foo([^a-zA-Z0-9])", "\\1bar\\2", "foobarfoobar foo bar foo bar") == "foobarfoobar bar bar bar bar")

// round
assert(round(1.1) == 1)

// set
assert(!(set([1, 2, 3]) < set([1, 2, 3])))
assert(!(set([4]) < set([1, 2, 3])))
assert(set([1, 1, 1, 2, 2, 3, 3, 4]) == set([1, 2, 3, 4]))
assert(set([1, 2, 3]) & set([3, 4, 5]) == set([3]))
assert(set([1, 2, 3]) - set([3, 4, 5]) == set([1, 2]))
assert(set([1, 2, 3]) | set([3, 4, 5]) == set([1, 2, 3, 4, 5]))
assert(bool(set([1, 2, 3])))
assert(set([1, 2]) < set([1, 2, 3]))
assert(bool(set([1, 2])))
assert(set([1]) < set([1, 2, 3]))
assert(bool(set([1])))

// set.isdisjoint
assert(!set([1, 2, 3]).isdisjoint(set([3, 4, 5])))
assert(set([1, 2, 3]).isdisjoint(set([4, 8, 16])))

// str (conversion)
assert(str(123) == "123")
// assert(str(1.23) == "1.23")

// str (indexing)
assert("foobar"[0] == "f")
assert("\r\t"[0] == "\r")
assert("\r\t"[1] == "\t")

// str (truthness)
assert(bool(" "))
assert(!bool(""))

// str (positive and negative indexing)
assert("foo"[-1] == "o")
assert("foo"[-2] == "o")
assert("foo"[0] == "f")
assert("foo"[len("foo")-1] == "o")

// str * int (repeat string)
assert("foo" * 3 == "foofoofoo")
assert("foo" * 3 == "foofoofoo")
assert(-1 * "foo" == "")
assert(0 * "foo" == "")
assert(1 * "foo" == "foo")
assert(2 * "foo" * 2 == "foofoofoofoo")
assert(2 * "foo" == "foofoo")

// str % tuple
assert("Hello %d! Number %s" % (1, "world") == "Hello 1! Number world")
assert("Hello %d!" % (1) == "Hello 1!")
assert("Hello %s! Number %d" % ("world", 1) == "Hello world! Number 1")
assert("Hello %s!" % ("world") == "Hello world!")
assert("With commit %d, this string building syntax is now %s!" % (197, "supported") == "With commit 197, this string building syntax is now supported!")
assert("foo %% bar %011d baz %s" % (100, "foobar") == "foo % bar 00000000100 baz foobar")
assert("foo %d" % (123) == "foo 123")

// str.capitalize
assert("".capitalize() == "")
assert("f".capitalize() == "F")
assert("fo".capitalize() == "Fo")
assert("foo baR".capitalize() == "Foo bar")
assert("foo".capitalize() == "Foo")

// str.center
assert("foo".center(5) == " foo ")
assert("foo".center(6, "-") == "-foo--")
assert("foobar".center(9, "-") == "--foobar-")
assert("foobar".center(4) == "foobar")

// str.count
assert("foo".count("f") == 1)
assert("foo".count("o") == 2)
assert("foo".count("b") == 0)

// str.endswith
assert("foobar".endswith("bar"))

// str.expandtabs
assert(len("\t".expandtabs()) == 8)
assert(len("\t".expandtabs(10)) == 10)
assert(len("\t\t".expandtabs(10)) == 20)
assert(len(("\t" * 2).expandtabs()) == 16)
assert("\t".expandtabs() == " " * 8)

// str.find
assert("foo".find("foobarfoobar") == -1)
assert("foobar".find("") == 0)
assert("foobar".find("bar") == 3)
assert("foobar".find("f") == 0)
assert("foobar".find("foobar") == 0)
assert("foobar".find("foobars") == -1)
assert("foobar".find("zbar") == -1)

// str.in (translated to "str1 in str" when running as Python code)
assert(!"foo".`in`("baz"))
assert(!"foobar".`in`(""))
assert("".`in`("foobar"))
assert("foo".`in`("foobar"))
assert("ob".`in`("foobar"))

// str.index
assert("foobar".index("foobar") == 0)
assert("foobar".index("") == 0)
assert("foobar".index("f") == 0)
assert("foobar".index("bar") == 3)

// str.isalnum
assert(!"foo ".isalnum())
assert("foo1".isalnum())

// str.isalpha
assert(!"foo1".isalpha())
assert("fooo".isalpha())

// str.isdigit
assert(!"foo1".isdigit())
assert("123".isdigit())

// str.islower
assert(!"FOO".islower())
assert("foo".islower())

// str.isspace
assert(!"  x ".isspace())
assert(!" a\t".isspace())
assert("   ".isspace())
assert(" \t".isspace())

// str.istitle
assert(!"foo foo".istitle())
assert(!"foo".istitle())
assert("Foo Foo".istitle())
assert("Foo".istitle())

// str.isupper
assert(!"foo".isupper())
assert("FOO".isupper())

// str.join
assert(":".join(["foo", "bar", "baz"]) == "foo:bar:baz")

// str.ljust
assert("foo".ljust(5) == "foo  ")
assert("foo".ljust(10, "-") == "foo-------")
assert("foobar".ljust(4) == "foobar")

// str.lower
assert("FooBar".lower() == "foobar")

// str.lstrip
assert(" \n\t foobar \n\t ".lstrip() == "foobar \n\t ")

// str.partition
assert("the first part\nthe second part".partition("\n") == ("the first part", "\n", "the second part"))
assert("the first part".partition("\n") == ("the first part", "", ""))
assert("the first part\n".partition("\n") == ("the first part", "\n", ""))
assert("\nthe second part".partition("\n") == ("", "\n", "the second part"))

// str.replace
assert("fzzbar".replace("z", "o") == "foobar")

// str.rjust
assert("foo".rjust(5) == "  foo")
assert("foo".rjust(10, "-") == "-------foo")
assert("foobar".rjust(4) == "foobar")

// str.rstrip
assert(" \n\t foobar \n\t ".rstrip() == " \n\t foobar")

// str.split
assert("a\t\n\r\t\n\t\n\r\nb\r\nc\t".split() == ["a", "b", "c"])
assert("foo bar".split(" ") == ["foo", "bar"])
assert("foo:bar:baz".split(":") == ["foo", "bar", "baz"])
assert("foo\r\n \r\nbar\rfoo\nfoo\n\nfoo\n\n\nfoo".split() == ["foo", "bar", "foo", "foo", "foo", "foo"])
assert("foo\r\nbar\rfoo\nfoo\n\nfoo\n\n\nfoo".split() == ["foo", "bar", "foo", "foo", "foo", "foo"])
assert(len(open("Pythonic-test.txt").read().split()) == 23)

// str.splitlines
assert("foo\naw\tef\roa\r\nwef".splitlines() == ["foo", "aw\tef", "oa", "wef"])
assert("foo\rfoo\nfoo\r\nfoo\n\rfoo\nfoo".splitlines() == ["foo", "foo", "foo", "foo", "", "foo", "foo"])
assert("\nfoo\rfoo\nfoo\r\nfoo\n\rfoo\nfoo\n".splitlines() == ["", "foo", "foo", "foo", "foo", "", "foo", "foo"])

// str.startswith
assert("foobar".startswith("foo"))

// str.strip
assert("  \n   foobar       \n   ".strip() == "foobar")
assert(" foobar ".strip() == "foobar")
assert("".strip() == "")
assert("foobar".strip() == "foobar")
assert(" \n\t foobar \n\t ".strip() == "foobar")

// str.swapcase
assert("foo".swapcase() == "FOO")
assert("FooBar".swapcase() == "fOObAR")
assert("›ƒé".swapcase() == "›ƒé")

// str.title
assert("foo bar".title() == "Foo Bar")

// str.upper
assert("FooBar".upper() == "FOOBAR")

// str.zfill
assert("foo".zfill(-1) == "foo")
assert("foo".zfill(0) == "foo")
assert("foo".zfill(1) == "foo")
assert("foo".zfill(10) == "0000000foo")
assert(len("foo".zfill(1000)) == 1000)

// sum
assert(sum([1, 2, 3]) == 6)
assert(sum([1, 2, 3], 1) == 7)
assert(sum([1.1, 1.2]) == 2.3)

// sys.argv
if len(sys.argv) == 1 && sys.argv[0] == "./Pythonic-test.swift" {
    // Make sure test case passes also when run using shebang line.
    sys.argv = ["./Pythonic-test", "arg1", "arg2"]
}
assert(sys.argv[0].startswith("./Pythonic-test"))
assert(sys.argv[1] == "arg1")
assert(sys.argv[2] == "arg2")
assert(len(sys.argv) == 3)

// sys.platform
assert(sys.platform == "darwin")

// time.time
assert(time.time() > 1405028001.224846)

// datetime
assert(datetime(2014, 7, 4) == datetime.strptime("07/04/14", "%m/%d/%y"))
assert(datetime.strptime("21/11/06 16:30", "%d/%m/%y %H:%M").strftime("%d/%m/%y %H:%M") == "21/11/06 16:30")
assert(datetime.strptime("21/11/06 16:30", "%d/%m/%y %H:%M").strftime("%d/%m/%y %H:%M") == "21/11/06 16:30")

// tuple – comparison of 2-part tuples
assert((1, 1) == (1, 1))
assert(!((1, 1) == (1, 214)))

// tuple – comparison of 3-part tuples
assert((1, 1, 1) == (1, 1, 1))
assert(!((1, 1, 1) == (1, 1, 214)))

// uuid
assert(len(uuid.uuid4().hex) == 32)

// xrange
assert(list(xrange(10)) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
assert(list(xrange(1, 10)) == [1, 2, 3, 4, 5, 6, 7, 8, 9])

// BUG: Due to a strange compiler bug (?) the following cannot be imported. Must be in same source file.
//      Same as http://www.openradar.me/17500497 ?
extension Array {
    mutating func pop(index: Int?) -> Array.Element? {
        let i = index ?? self.count - 1
        guard self.count == 0 || i < 0 || i >= self.count else {
            return nil
        }
        defer { self.removeAtIndex(i) }
        return self[i]
    }

    mutating func pop() -> Array.Element? {
        return self.pop(nil)
    }
}

// // BUG: Due to a strange compiler bug (?) the following cannot be imported. Must be in same source file.
// //      Same as http://www.openradar.me/17500497 ?
// public extension Dictionary {
//     public func get(key: Key) -> Value? {
//         return self[key]
//     }
//
//     public func hasKey(key: Key) -> Bool {
//         if let _ = self.get(key) {
//             return true
//         }
//         return false
//     }
//
//     public func has_key(key: Key) -> Bool {
//         return hasKey(key)
//     }
//
//     public mutating func pop(key: Key) -> Value? {
//         if let val = self.get(key) {
//             self.removeValueForKey(key)
//             return val
//         }
//         return nil
//     }
//
//     public mutating func popItem() -> (Key, Value)? {
//         if self.count == 0 {
//             return nil
//         }
//         var key = Array(self.keys)[0]
//         var value = self.pop(key)!
//         return (key, value)
//     }
//
//     public mutating func popitem() -> (Key, Value)? {
//         return popItem()
//     }
//
//     public func items() -> [(Key, Value)] {
//         return zip(self.keys, self.values)
//     }
//
//     public static func fromKeys(sequence: [Key], _ defaultValue: Value) -> [Key : Value]{
//         var dict = [Key : Value]()
//         for key in sequence {
//             dict[key] = defaultValue
//         }
//         return dict
//     }
//
//     public static func fromkeys(sequence: [Key], _ defaultValue: Value) -> [Key : Value] {
//         return fromKeys(sequence, defaultValue)
//     }
//
//     public func copy() -> [Key : Value] {
//         return self
//     }
// }
//
// // BUG: has_attr does not work due to the following compiler bug (?)
// // invalid linkage type for global declaration
// // %swift.full_heapmetadata* @_TMdC4mainL_3Baz
// // LLVM ERROR: Broken module found, compilation aborted!
// // func hasattr(object: Any, searchedPropertyName: String) -> Bool {
// //     var mirror = reflect(object)
// //     for var propertyNumber = 0; propertyNumber < mirror.count; propertyNumber++ {
// //         let (propertyName, propertyMirror) = mirror[propertyNumber]
// //         // print("\(propertyName) = \(propertyMirror.summary), \(propertyMirror.count) children")
// //         if propertyName == searchedPropertyName {
// //             return true
// //         }
// //     }
// //     return false
// // }

// This could probably be turned into valid Python code if we implemented the StringIO module
func fileHandleFromString(text: String) -> NSFileHandle {
    let pipe = NSPipe()
    let input = pipe.fileHandleForWriting
    input.writeData(text.dataUsingEncoding(NSUTF8StringEncoding)!)
    input.closeFile()
    return pipe.fileHandleForReading
}

let performPythonIncompatibleTests = true
if performPythonIncompatibleTests {
    // dict (semantics + copy())
    var dict1 = ["foo": 1]
    assert(dict1["foo"] != nil)
    assert(dict1["bar"] == nil)
    var dict2 = dict1
    dict2["bar"] = 2
    assert(dict1["foo"] != nil)
    assert(dict1["bar"] == nil)
    assert(dict2["foo"] != nil)
    assert(dict2["bar"] != nil)
    var dict3 = dict1
    dict3["bar"] = 3
    assert(dict1["foo"] != nil)
    assert(dict1["bar"] == nil)
    assert(dict3["foo"] != nil)
    assert(dict3["bar"] != nil)

    // dict
    // assert(!dict<str, str>())
    assert(bool(["foo": "bar"]))
    // assert(len(dict<str, str>()) == 0)

    // dict.fromkeys
    // assert(dict.fromkeys(["a", "b", "c"], 1) == ["a": 1, "c": 1, "b": 1])

    // dict.items
    // var h = ["foo": 1, "bar": 2, "baz": 3]
    // var arrayOfTuples = h.items()
    // arrayOfTuples.sort() { $0.1 < $1.1 }

    // assert(arrayOfTuples[0].0 == "foo" && arrayOfTuples[0].1 == 1)
    // assert(arrayOfTuples[1].0 == "bar" && arrayOfTuples[1].1 == 2)
    // assert(arrayOfTuples[2].0 == "baz" && arrayOfTuples[2].1 == 3)

    // divmod
    assert(divmod(100, 9).0 == 11)
    assert(divmod(100, 9).1 == 1)
    assert(divmod(101.0, 8.0).0 == 12.0)
    assert(divmod(101.0, 8.0).1 == 5.0)
    assert(divmod(102.0, 7).0 == 14.0)
    assert(divmod(102.0, 7).1 == 4.0)
    assert(divmod(103, 6.0).0 == 17.0)
    assert(divmod(103, 6.0).1 == 1.0)

    // double.isInteger
    var d1 = 1.0
    var d2 = 1.1
    assert(d1.isInteger())
    assert(!d2.isInteger())

    // float.isInteger
    assert(float(1.0).isInteger())
    assert(!float(1.1).isInteger())

    // hasattr (commented out due to compiler bug)
    // class Baz {
    //     var foo = "foobar"
    //     var bar = "foobar"
    // }
    // var baz = Baz()
    // assert(hasattr(baz, "foo"))
    // assert(hasattr(baz, "baz") == false)

    // list
    // assert(!list<int>())

    // list.count + list.index + list.reverseInPlace
    // var arr: [String] = ["foo", "bar", "baz", "foo"]
    // assert(arr.count("foo") == 2)
    // arr.remove("foo")
    // assert(arr.count("foo") == 1)
    // assert(arr.index("bar") == 0)
    // arr.append("hello")
    // assert(arr.index("hello") == 3)
    // arr.reverseInPlace()
    // assert(arr.index("hello") == 0)

    // list.index
    // assert(["foo", "bar", "baz"].index(1) == nil)
    // assert([1, 2, 3].index("foo") == nil)
    // assert([1, 2, 3].index(4) == nil)

    // list.pop
    // var mutableArray = [1, 2, 3]
    // assert(mutableArray.pop() == 3)
    // assert(mutableArray.pop(0) == 1)
    // assert(mutableArray.pop(1) == nil)
    // assert(mutableArray.pop(0) == 2)
    // assert(mutableArray.pop() == nil)

    // list.remove
    // var anotherMutableArray = [3, 2, 1, 3]
    // anotherMutableArray.remove(0)
    // assert(anotherMutableArray == [3, 2, 1, 3])
    // anotherMutableArray.remove(2)
    // assert(anotherMutableArray == [3, 1, 3])
    // anotherMutableArray.remove(1)
    // assert(anotherMutableArray == [3, 3])
    // anotherMutableArray.remove(3)
    // assert(anotherMutableArray == [3])
    // anotherMutableArray.remove(3)
    // assert(anotherMutableArray == [])

    // len
    assert(len(list<str>()) == 0)
    assert(len(["foo": "bar"]) == 1)
    assert(len(["foo": "bar", "baz": "foo"]) == 2)

    // map
    var mapObj = ["foo": "foobar"]
    assert(len(mapObj) == 1)
    assert(mapObj["foo"] != nil)

    // map.get
    // assert(mapObj.get("foo") == "foobar")

    // map.has_key/hasKey
    // assert(mapObj.has_key("foo"))
    // assert(mapObj.hasKey("foo"))

    // map.pop
    // assert(mapObj.pop("foo") == "foobar")
    // assert(len(mapObj) == 0)

    // map.popItem
    // mapObj["foo"] = "bar"
    // let t = mapObj.popItem()
    // assert(len(mapObj) == 0)

    // map.clear
    // mapObj.clear()
    // assert(len(mapObj) == 0)
    // assert(mapObj["foobar"] == nil)

    // open(…) [modes: w, a, r (default)] + fh.write + fh.close + os.path.exists
    let temporaryTestFile = "/tmp/pythonic-io.txt"
    var f = open(temporaryTestFile, "w")
    f.write("foo")
    f.close()
    f = open(temporaryTestFile, "a")
    f.write("bar\n")
    f.close()
    f = open(temporaryTestFile)
    var foundText = false
    for line in f {
        if line == "foobar" {
            foundText = true
        }
    }
    assert(foundText)
    assert(os.path.exists(temporaryTestFile))
    os.unlink(temporaryTestFile)
    assert(!os.path.exists(temporaryTestFile))

    // os.popen3
    var (stdin, stdout, stderr) = os.popen3("/bin/echo foo")
    var foundOutput = false
    for line in stdout {
        if line == "foo" {
            foundOutput = true
        }
    }
    assert(foundOutput)

    // os.popen2
    foundOutput = false
    (stdin, stdout) = os.popen2("/bin/echo foo")
    for line in stdout {
        if line == "foo" {
            foundOutput = true
        }
    }
    assert(foundOutput)

    // random.choice
    var array = ["foo", "bar"]
    var randomChoice = random.choice(array)
    assert(randomChoice == "foo" || randomChoice == "bar")

    // re.search
    assert(!re.search("", "foobarbaz"))

    // re.search.group
    assert(re.search("^foo", "foobarbaz")[0] == "foo")

    // set
    var emptyIntSet: Set<Int> = set()
    assert(!emptyIntSet)
    // assert(set([1, 2, 3]) + set([3, 4, 5]) == set([1, 2, 3, 4, 5])) // Swift compiler bug: Enabling this test increases compilation time by roughly 1.5 seconds.
    // assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) != set([set([1, 2, 3]), set([2, 4, 9])])) // Swift compiler bug: Enabling this test increases compilation time by >60 seconds.
    // assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) == set([set([1, 2, 3]), set([2, 4, 8])])) // Swift compiler bug: Enabling this test increases compilation time by >60 seconds.
    assert(bool(set([1, 2, 3])))
    var set1 = Set<Int>()
    assert(set1.isEmpty)
    set1 += 1
    assert(set1.count == 1)
    assert(set1 == Set([1]))
    set1.add(2)
    assert(set1 == Set([1, 2]))
    set1.add(3)
    assert(set1 == Set([1, 2, 3]))
    set1.add(1)
    assert(set1 == Set([1, 2, 3]))
    set1.add(2)
    assert(set1 == Set([1, 2, 3]))
    set1.add(3)
    assert(set1 == Set([1, 2, 3]))
    set1.remove(2)
    assert(set1 == Set([1, 3]))
    set1.remove(2)
    assert(set1 == Set([1, 3]))
    set1 -= 2
    assert(set1 == Set([1, 3]))
    var set2 = Set([1, 8, 16, 32, 64, 128])
    assert(set2 == Set([128, 64, 32, 16, 8, 1]))
    var set3 = set1 + set2
    assert(set3 == Set([128, 64, 32, 16, 8, 1, 3]))
    var set4 = set1 - set2
    assert(set4 == Set([3]))
    set4 += set2
    assert(set4 == Set([128, 64, 32, 16, 8, 1, 3]))
    set4 -= set2
    assert(set4 == Set([3]))
    var set5 = Set(set4)
    assert(set5 == Set([3]))
    assert(set5 == set4)
    var set6 = Set([1, 2, 3]) & Set([1, 3])
    assert(set6 == Set([1, 3]))
    set6 &= set6
    assert(set6 == Set([1, 3]))
    var set7 = Set([1, 2, 3]) | Set([1, 3])
    assert(set7 == Set([1, 2, 3]))
    set7 |= set7
    assert(set7 == Set([1, 2, 3]))
    var set8: Set<Int> = [1, 2, 3]
    assert(len(set8) == 3)
    var set9 = Set([0, 1, 2])
    set9.add(3)
    set9.add(3)
    assert(set9 == Set([0, 1, 2, 3]))
    var set10 = Set([2, 4, 8, 16])
    assert(set9 + set10 == Set([0, 1, 2, 3, 4, 8, 16]))
    assert(set9 - set10 == Set([0, 1, 3]))
    assert(set9 & set10 == Set([2]))
    assert(set([1, 2, 3]).contains(1))
    assert(!set([1, 2, 3]).contains(4))

    // statistics.mean
    assert(statistics.mean([-1.0, 2.5, 3.25, 5.75]) == 2.625)
    assert(statistics.mean([0.5, 0.75, 0.625, 0.375]) == 0.5625)
    assert(statistics.mean([1, 2, 3, 4, 4]) == 2.8)

    // statistics.median
    assert(statistics.median([1, 3, 5, 7]) == 4.0)
    assert(statistics.median([1, 3, 5]) == 3)
    assert(statistics.median([2, 3, 4, 5]) == 3.5)

    // statistics.median_high
    assert(statistics.median_high([1, 3, 5]) == 3)
    assert(statistics.median_high([1, 3, 5, 7]) == 5)

    // statistics.median_low
    assert(statistics.median_low([1, 3, 5]) == 3)
    assert(statistics.median_low([1, 3, 5, 7]) == 3)

    // str (handling of "\r\n" not compatible with Python)
    assert("\r\n\t"[0] == "\r\n")
    assert("\r\n\t"[1] == "\t")

    // str.endsWith
    assert("foobar".endsWith("bar"))

    // str.index
    assert("foobar".index("foobars") == -1)
    assert("foobar".index("zbar") == -1)

    // str.split
    assert("foobar".split("") == ["foobar"])

    // str.startsWith
    assert("foobar".startsWith("foo"))

    // str.title
    assert("they're bill's friends from the UK".title() == "They're Bill's Friends From The Uk")

    // str[(Int?, Int?)]
    assert("Python"[(nil, 2)] == "Py")
    assert("Python"[(2, nil)] == "thon")
    assert("Python"[(2, 4)] == "th")
    assert("Python"[(nil, -3)] == "Pyt")
    assert("Python"[(-3, nil)] == "hon")

    // str[range]
    assert("foobar"[0..<3] == "foo")

    // time.sleep
    time.sleep(0.001)

    // datetime
    let day = NSDate.strptime("11/08/14 21:13", "%d/%m/%y %H:%M")
    assert(day.strftime("%a %A %w %d %b %B %m %y %Y") == "Mon Monday 1 11 Aug August 08 14 2014")
    assert(day.strftime("%H %I %p %M %S %f %j %%") == "21 09 pm 13 00 000000 223 %" || day.strftime("%H %I %p %M %S %f %j %%") == "21 09 PM 13 00 000000 223 %")
    assert(day.strftime("It's day number %d; the month is %B.") == "It's day number 11; the month is August.")
    assert(day.isoformat(" ") == "2014-08-11 21:13:00")

    // timedelta
    let year = timedelta(days: 365)
    let anotherYear = timedelta(weeks: 40, days: 84, hours: 23, minutes: 50, seconds: 600)
    assert(year.total_seconds() == 31536000.0)
    assert(year == anotherYear)

    // datetime & timedelta
    let oneDayDelta = timedelta(days: 1)
    let nextDay = day + oneDayDelta
    let previousDay = day - oneDayDelta
    assert(nextDay - previousDay == oneDayDelta * 2)
    let otherDay = day.replace(day: 15, hour: 22)
    assert(otherDay - nextDay == timedelta(days: 3, seconds: 60 * 60))

    // zip
    // var zipped = zip([3, 4], [9, 16])
    // var (l1, r1) = zipped[0]
    // assert(l1 == 3 && r1 == 9)
    // var (l2, r2) = zipped[1]
    // assert(l2 == 4 && r2 == 16)

    // file.__iter__ , as in "for line in open(filename)"
    var filehandletest = ""
    for line in fileHandleFromString("line 1\nline 2\n") {
        filehandletest += line + "\n"
    }
    assert(filehandletest == "line 1\nline 2\n")
    assert(["line 1", "line 2"] == Array(fileHandleFromString("line 1\nline 2\n")))

    assert(["line 1"] == Array(fileHandleFromString("line 1\n")))
    assert(["line 1"] == Array(fileHandleFromString("line 1")))
    assert(["line 1", "", "line 3"] == Array(fileHandleFromString("line 1\n\nline 3")))
    assert(["", "line 2", "line 3"] == Array(fileHandleFromString("\nline 2\nline 3")))
    assert(["", "", "line 3"] == Array(fileHandleFromString("\n\nline 3")))

    // Others:
    assert("foobar"[0..<2] == "fo")
    assert(bool("x" as Character))
}

var performTestsRequiringNetworkConnectivity = false
if performTestsRequiringNetworkConnectivity &&
    performPythonIncompatibleTests {
    let getTest = requests.get("http://httpbin.org/get")
    print("GET:")
    print(getTest.text)
    let postDataString = "…"
    let postTestWithString = requests.post("http://httpbin.org/post", postDataString)
    print("POST(str):")
    print(postTestWithString.text)
    let postDataDict = ["…": "…", "key": "value", "number": "123"]
    let postTestWithDict = requests.post("http://httpbin.org/post", postDataDict)
    print("POST(dict):")
    print(postTestWithDict.text)
}

sys.exit()

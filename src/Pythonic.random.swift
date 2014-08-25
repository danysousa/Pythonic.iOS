// Python docs: https://docs.python.org/2/library/random.html
//
// Most frequently used:
//   94 random.randint
//   73 random.choice
//   32 random.shuffle
//   28 random.random
//    9 random.randrange
//    4 random.seed
//    4 random.sample
//    2 random.expovariate
//    1 random.uniform
//
// >>> filter(lambda s: re.match("^[a-z]", s), dir(random))
//   betavariate: TODO.
//   choice: Added.
//   division: TODO.
//   expovariate: TODO.
//   gammavariate: TODO.
//   gauss: TODO.
//   getrandbits: TODO.
//   getstate: TODO.
//   jumpahead: TODO.
//   lognormvariate: TODO.
//   normalvariate: TODO.
//   paretovariate: TODO.
//   randint: Added.
//   random: Added.
//   randrange: Added.
//   sample: TODO.
//   seed: TODO.
//   setstate: TODO.
//   shuffle: TODO.
//   triangular: TODO.
//   uniform: TODO.
//   vonmisesvariate: TODO.
//   weibullvariate: TODO.

import Darwin

public class random {
    public class func random() -> Double {
        return Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
    }

    public class func randInt(min: Int, _ max: Int) -> Int {
        return Int(Pythonic.random.random() * Double(max - min + 1)) + min
    }

    public class func randint(min: Int, _ max: Int) -> Int {
        return Pythonic.random.randInt(min, max)
    }

    public class func randRange(start: Int, _ stop: Int) -> Int {
        return Pythonic.random.randInt(start, stop - 1)
    }

    public class func randrange(start: Int, _ stop: Int) -> Int {
        return Pythonic.random.randRange(start, stop)
    }

    public class func choice<R : SequenceType where R.Generator.Element : Comparable>(sequence: R) -> R.Generator.Element {
        var arr = Array(sequence)
        return arr[Pythonic.random.randRange(0, len(arr))]
    }
}

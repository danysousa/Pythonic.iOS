public class fileinput {
    public class func input() -> [String] {
        if len(sys.argv) >= 2 {
            var lines = [String]()
            for fileName in sys.argv[1..<len(sys.argv)] {
                let f = open(fileName)
                lines += f.readlines()
                f.close()
            }
            return lines
        } else {
            return sys.stdin.readlines()
        }
    }
}

// https://docs.python.org/3/library/statistics.html#module-statistics
// http://hg.python.org/cpython/file/3.4/Lib/statistics.py

public class statistics {
    public class func mean(data: [Double]) -> Double {
        let n = len(data)
        assert(n > 0, "mean requires at least one data point")
        return sum(data) / Double(n)
    }

    public class func median(data: [Double]) -> Double {
        let sortedData = data.sort()
        let n = len(sortedData)
        assert(n > 0, "no median for empty data")
        if n % 2 == 1 {
            return sortedData[n / 2]
        } else {
            let i = n / 2
            return (sortedData[i - 1] + sortedData[i]) / 2
        }
    }

    public class func medianLow(data: [Double]) -> Double {
        let sortedData = data.sort()
        let n = len(sortedData)
        assert(n > 0, "no median for empty data")
        if n % 2 == 1 {
            return sortedData[n / 2]
        } else {
            return sortedData[n / 2 - 1]
        }
    }

    public class func median_low(data: [Double]) -> Double {
        return medianLow(data)
    }

    public class func medianHigh(data: [Double]) -> Double {
        let sortedData = data.sort()
        let n = len(sortedData)
        assert(n > 0, "no median for empty data")
        return sortedData[n / 2]
    }

    public class func median_high(data: [Double]) -> Double {
        return medianHigh(data)
    }

    // Not implemented yet:
    /*
    public class func medianGrouped(data: [Double]) -> Double {
        return -1
    }

    public class func median_grouped(data: [Double]) -> Double {
        return medianGrouped(data)
    }

    public class func mode(data: [Double]) -> Double {
        return -1
    }

    public class func pvariance(data: [Double]) -> Double {
        return -1
    }

    public class func variance(data: [Double]) -> Double {
        return -1
    }

    public class func pstdev(data: [Double]) -> Double {
        return -1
    }

    public class func stdev(data: [Double]) -> Double {
        return -1
    }
    */
}

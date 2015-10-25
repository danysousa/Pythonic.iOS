// Python docs: https://docs.python.org/2/library/datetime.html
//
// Most frequently used:
// 336 datetime.now
// 173 datetime.timedelta
// 102 datetime.date
//  41 datetime.today
//  20 datetime.strptime
//  17 datetime.fromtimestamp
//  14 datetime.time
//  10 datetime.combine
//   6 datetime.utcnow
//   3 datetime.tzinfo
//
// >>> filter(lambda s: not s.startswith("_"), dir(datetime.datetime))
//   astimezone
//   combine
//   ctime
//   date
//   day
//   dst
//   fromordinal
//   fromtimestamp
//   hour
//   isocalendar
//   isoformat
//   isoweekday
//   max
//   microsecond
//   min
//   minute
//   month
//   now
//   replace
//   resolution
//   second
//   strftime
//   strptime
//   time
//   timetuple
//   timetz
//   today
//   toordinal
//   tzinfo
//   tzname
//   utcfromtimestamp
//   utcnow
//   utcoffset
//   utctimetuple
//   weekday
//   year

import Foundation

public typealias datetime = NSDate
public typealias timedelta = NSTimeInterval

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

public func -(lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
    return lhs.timeIntervalSinceDate(rhs)
}

public func -(lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return lhs.dateByAddingTimeInterval(-1 * rhs)
}

public func +(lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return lhs.dateByAddingTimeInterval(rhs)
}

public extension NSTimeInterval {
    public init(days: Int = 0, seconds: Int = 0, microseconds: Int = 0, milliseconds: Int = 0, minutes: Int = 0, hours: Int = 0, weeks: Int = 0) {
        let seconds = (((weeks * 7 + days) * 24 + hours) * 60 + minutes) * 60 + seconds
        let part1 = Double(seconds)
        let part2 = Double(milliseconds) / 1_000
        let part3 = Double(microseconds) / 1_000_000
        self = part1 + part2 + part3
    }

    private static var oneDay = 86400.0

    public var days: Int {
        if self > 0 {
            return Int(self / NSTimeInterval.oneDay)
        } else {
            return Int(self / NSTimeInterval.oneDay) - 1
        }
    }

    public var seconds: Int {
        if self > 0 {
            return Int(self % NSTimeInterval.oneDay)
        } else {
            return Int((self - (Double(self.days) * NSTimeInterval.oneDay)) % NSTimeInterval.oneDay)
        }
    }

    public var microseconds: Int {
        // subtract integer portion of self, multiply what's left by 1_000_000, convert to Int
        return Int((self - floor(self)) * 1_000_000)
    }

    public func total_seconds() -> Double {
        return self
    }
}

public extension NSDate {
    public convenience init(_ year: Int, _ month: Int, _ day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0, microsecond: Int = 0) {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = microsecond * 1000
        if let date = NSCalendar.currentCalendar().dateFromComponents(components) {
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        } else {
            self.init()
        }
    }

    public class func utcnow() -> NSDate {
        return NSDate()
    }

    public class func today() -> NSDate {
        return NSDate()
    }

    public var year: Int {
        let components = NSCalendar.currentCalendar().components(.Year, fromDate: self)
        return components.year
    }

    public var month: Int {
        let components = NSCalendar.currentCalendar().components(.Month, fromDate: self)
        return components.month
    }

    public var day: Int {
        let components = NSCalendar.currentCalendar().components(.Day, fromDate: self)
        return components.day
    }

    public var hour: Int {
        let components = NSCalendar.currentCalendar().components(.Hour, fromDate: self)
        return components.hour
    }

    public var minute: Int {
        let components = NSCalendar.currentCalendar().components(.Minute, fromDate: self)
        return components.minute
    }

    public var second: Int {
        let components = NSCalendar.currentCalendar().components(.Second, fromDate: self)
        return components.second
    }

    public var microsecond: Int {
        let components = NSCalendar.currentCalendar().components(.Nanosecond, fromDate: self)
        return components.nanosecond / 1000
    }

    public func replace(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, microsecond: Int? = nil) -> NSDate {
        let unitFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second, .Nanosecond, .Era, .Quarter, .TimeZone]
        let components = NSCalendar.currentCalendar().components(unitFlags, fromDate: self)
        if let year = year {
            components.year = year
        }
        if let month = month {
            components.month = month
        }
        if let day = day {
            components.day = day
        }
        if let hour = hour {
            components.hour = hour
        }
        if let minute = minute {
            components.minute = minute
        }
        if let second = second {
            components.second = second
        }
        if let microsecond = microsecond {
            components.nanosecond = microsecond * 1000
        }
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }

    public func weekday() -> Int {
        let components = NSCalendar.currentCalendar().components(.Weekday, fromDate: self)
        return (components.weekday + 5) % 7
    }

    public func isoweekday() -> Int {
        return self.weekday() + 1
    }
}

public extension NSDate {
    // conversion from Python's date format to Unicode Technical Standard #35, used by NSDateFormatter
    // https://docs.python.org/2/library/datetime.html#strftime-strptime-behavior
    // http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
    private class func convertFormat(format: String) -> String? {
        func symbolForToken(token: String) -> String {
            switch token {
            case "%a":    // Weekday as locale’s abbreviated name.
                return "EEE"
            case "%A":    // Weekday as locale’s full name.
                return "EEEE"
            case "%w":    // Weekday as a decimal number, where 0 is Sunday and 6 is Saturday.    0, 1, ..., 6
                return "ccccc"
            case "%d":    // Day of the month as a zero-padded decimal number.    01, 02, ..., 31
                return "dd"
            case "%b":    // Month as locale’s abbreviated name.
                return "MMM"
            case "%B":    // Month as locale’s full name.
                return "MMMM"
            case "%m":    // Month as a zero-padded decimal number.    01, 02, ..., 12
                return "MM"
            case "%y":    // Year without century as a zero-padded decimal number.    00, 01, ..., 99
                return "yy"
            case "%Y":    // Year with century as a decimal number.    1970, 1988, 2001, 2013
                return "yyyy"
            case "%H":    // Hour (24-hour clock) as a zero-padded decimal number.    00, 01, ..., 23
                return "HH"
            case "%I":    // Hour (12-hour clock) as a zero-padded decimal number.    01, 02, ..., 12
                return "hh"
            case "%p":    // Locale’s equivalent of either AM or PM.
                return "a"
            case "%M":    // Minute as a zero-padded decimal number.    00, 01, ..., 59
                return "mm"
            case "%S":    // Second as a zero-padded decimal number.    00, 01, ..., 59
                return "ss"
            case "%f":    // Microsecond as a decimal number, zero-padded on the left.    000000, 000001, ..., 999999
                return "SSSSSS"
            case "%z":    // UTC offset in the form +HHMM or -HHMM (empty string if the the object is naive).    (empty), +0000, -0400, +1030
                return "Z"
            case "%Z":    // Time zone name (empty string if the object is naive).    (empty), UTC, EST, CST
                return "z"
            case "%j":    // Day of the year as a zero-padded decimal number.    001, 002, ..., 366
                return "DDD"
            case "%U":    // Week number of the year (Sunday as the first day of the week) as a zero padded decimal number. All days in a new year preceding the first Sunday are considered to be in week 0.    00, 01, ..., 53    (6)
                return "ww"
            case "%W":    // Week number of the year (Monday as the first day of the week) as a decimal number. All days in a new year preceding the first Monday are considered to be in week 0.    00, 01, ..., 53    (6)
                return "ww"   // one of these can't be right
            case "%c":    // Locale’s appropriate date and time representation.
                return ""     // unsupported
            case "%x":    // Locale’s appropriate date representation.
                return ""     // unsupported
            case "%X":    // Locale’s appropriate time representation.
                return ""     // unsupported
            case "%%":    // A literal '%' character.
                return "%"
            default:
                return ""
            }
        }

        var newFormat = ""
        var inQuotedText = false
        var i = format.startIndex
        while i < format.endIndex {
            if format[i] == "%" {
                if i.successor() >= format.endIndex {
                    return nil
                }
                i = i.successor()
                let token = "%\(format[i])"
                if inQuotedText {
                    newFormat += "'"
                    inQuotedText = false
                }
                newFormat += symbolForToken(token)
            } else {
                if "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters.contains(format[i]) {
                    if !inQuotedText {
                        newFormat += "'"
                        inQuotedText = true
                    }
                } else if format[i] == "'" {
                    newFormat += "'"
                }
                newFormat += String(format[i])
            }
            i = i.successor()
        }
        if inQuotedText {
            newFormat += "'"
        }
        return newFormat
    }

    public class func strptime(dateString: String, _ format: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        if let format = NSDate.convertFormat(format) {
            dateFormatter.dateFormat = format
        } else {
            dateFormatter.dateFormat = ""
        }
        // fix so weekdays can be Sunday = 0, not Sunday = 1
        dateFormatter.veryShortStandaloneWeekdaySymbols = ["0", "1", "2", "3", "4", "5", "6"]
        return dateFormatter.dateFromString(dateString)!
    }

    public func strftime(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = NSDate.convertFormat(format)
        // fix so weekdays can be Sunday = 0, not Sunday = 1
        dateFormatter.veryShortStandaloneWeekdaySymbols = ["0", "1", "2", "3", "4", "5", "6"]
        return dateFormatter.stringFromDate(self)
    }

    public func isoformat(sep: String = "T") -> String {
        var format = "%Y-%m-%d\(sep)%H:%M:%S"
        if self.microsecond != 0 {
            format += ".%f"
        }
        return self.strftime(format)
    }
}

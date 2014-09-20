// Python docs: https://docs.python.org/2/library/json.html
//
// Most frequently used:
//  208 json.dumps
//  191 json.loads
//   28 json.load
//    9 json.dump
//    8 json.JSONEncoder
//    3 json.JSONDecoder
//
// >>> filter(lambda s: not s.startswith("_"), dir(json))
//   JSONDecoder
//   JSONEncoder
//   decoder
//   dump
//   dumps
//   encoder
//   load
//   loads
//   scanner

import Foundation

public class json {
    public class func dumps(obj: AnyObject) -> String {
        var jsonData = NSJSONSerialization.dataWithJSONObject(obj, options: .PrettyPrinted, error: nil)
        if let jsonData = jsonData {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
        }
        return ""
    }

    public class func loads(json: String) -> AnyObject {
        var jsonData = json.dataUsingEncoding(NSUTF8StringEncoding)
        var jsonObject: AnyObject = NSJSONSerialization.JSONObjectWithData(jsonData!, options: .MutableContainers, error: nil)!
        return jsonObject
    }
}

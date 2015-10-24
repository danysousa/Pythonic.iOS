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
        let jsonData = try? NSJSONSerialization.dataWithJSONObject(obj, options: .PrettyPrinted)
        if let jsonData = jsonData {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        }
        return ""
    }

    public class func loads(json: String) -> AnyObject {
        let jsonData = json.dataUsingEncoding(NSUTF8StringEncoding)
        let jsonObject: AnyObject = try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: .MutableContainers)
        return jsonObject
    }
}

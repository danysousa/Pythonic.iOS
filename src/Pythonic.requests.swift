// ==========================================================================
// WARNING: This is work in progress. Quite a lot of work remains to be done.
//          This class is NOT ready for production :-)
// ==========================================================================

// Python docs: http://docs.python-requests.org/en/latest/

import Foundation

public struct HttpResponse {
    public let ok: Bool
    public let text: String?
    // TODO: func json()
}

private enum HttpMethod {
    case GET, POST
}

private class HttpUtils {
    private class func encodeDictionaryAsPercentEscapedString(dictionary: Dictionary<String, String>) -> String {
        var parts = [String]()
        for (key, value) in dictionary {
            let encodedKey = (key as NSString).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            let encodedValue = (value as NSString).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            parts += ["\(encodedKey)=\(encodedValue)"]
        }
        return parts.joinWithSeparator("&")
    }
}

public class HttpSession {
    private var cookies: [String : String] = [:]

    private func makeHttpRequest(methodType: HttpMethod, url: String, data: [String : String]? = nil, dataAsString: String? = nil, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = 600, cookies: [String : String]? = nil) -> HttpResponse {
        // TODO: Handle all options.
        let nsUrl = NSURL(string: url)
        let nsMutableUrlRequest = NSMutableURLRequest(URL: nsUrl!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: timeout!)
        switch (methodType) {
        case .GET:
            nsMutableUrlRequest.HTTPMethod = "GET"
        case .POST:
            var stringToPost: String!
            if let data = data {
                stringToPost = HttpUtils.encodeDictionaryAsPercentEscapedString(data)
            } else if dataAsString != nil {
                stringToPost = dataAsString!
            } else {
                assert(false)
            }
            nsMutableUrlRequest.HTTPMethod = "POST"
            let postData: NSData = NSString(string: stringToPost).dataUsingEncoding(NSUTF8StringEncoding)!
            nsMutableUrlRequest.setValue("\(postData.length)", forHTTPHeaderField: "Content-Length")
            nsMutableUrlRequest.setValue("application/x-www-form-urlencoded charset=utf-8", forHTTPHeaderField: "Content-Type")
            nsMutableUrlRequest.HTTPBody = postData
        }
        var nsUrlResponse: NSURLResponse?
        var text: String? = nil
        var ok = false
        do {
            // TODO: Proper error checking. Read HTTP status code.
            let nsData = try NSURLConnection.sendSynchronousRequest(nsMutableUrlRequest, returningResponse: &nsUrlResponse)
            text = NSString(data: nsData, encoding: NSUTF8StringEncoding) as? String
            ok = true
        } catch _ {}
        return HttpResponse(ok: ok, text: text)

    }

    public func get(url: String, params: [String : String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return makeHttpRequest(.GET, url: url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public func post(url: String, _ data: [String : String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return makeHttpRequest(.POST, url: url, data: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public func post(url: String, _ data: String, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return makeHttpRequest(.POST, url: url, dataAsString: data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }
}

public class requests {
    public class func Session() -> HttpSession {
        return HttpSession()
    }

    public class func session() -> HttpSession {
        return Session()
    }

    public class func get(url: String, params: [String: String]? = nil, auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().get(url, params: params, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public class func post(url: String, data: [String: String], auth: (String, String)? = nil, headers: [String : String]? = nil, timeout: Double? = nil, cookies: [String : String]? = nil) -> HttpResponse {
        return HttpSession().post(url, data, auth: auth, headers: headers, timeout: timeout, cookies: cookies)
    }

    public class func post(url: String, _ data: [String: String]) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }

    public class func post(url: String, _ data: String) -> HttpResponse {
        return HttpSession().post(url, data, auth: nil, headers: nil, timeout: nil)
    }
}

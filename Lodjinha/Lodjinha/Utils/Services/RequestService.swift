//
//  RequestService.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

class RequestService: NSObject {
    class func request(endpoint: String, method: HTTPMethod = .get, parameters: [String : Any]? = nil) -> RequestConfig {
        return RequestService.requestURLReplacements(endpoint: endpoint, method: method, parameters: parameters, replacements: nil)
    }
    
    class func requestURLReplacements(endpoint: String, method: HTTPMethod = .get, parameters: [String : Any]? = nil, replacements: [String : Any]?  = nil) -> RequestConfig {
        let encoding = RequestService.encoding(method)
        let requestURL = RequestService.prepareURLRequest(requestString: endpoint, URLparameters: replacements)!
        return RequestConfig(url: requestURL, method: method, parameters: parameters, headers: nil, parametersEncoding: encoding)
    }
    
    class func encoding(_ method: HTTPMethod) -> ParameterEncoding {
        if method == .get {
            return URLEncoding.queryString
        } else {
            return JSONEncoding.default
        }
    }
}

extension RequestService {
    class func prepareURLRequest(requestString: String, URLparameters: [String : Any]?) -> URL? {
        var urlString: String = requestString.replacingOccurrences(of: "${bundle}", with: Bundle.main.bundleURL.absoluteString)
        
        if URLparameters != nil {
            for key in (URLparameters! as NSDictionary).allKeys {
                let value = (URLparameters! as NSDictionary).object(forKey: key) as! String
                urlString = urlString.replacingOccurrences(of: "{\(key)}", with: value)
            }
            return URL(string: urlString)
        }
        
        return URL(string: urlString)
    }
}

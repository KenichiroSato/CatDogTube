//
//  Http.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/25.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class Http: NSObject {

    enum Method:String {
        case GET = "GET"
        case POST = "POST"
    }
    
    enum StatusCode: Int {
        case OK = 200
        
        case BAD_REQUEST = 400
        case UNAUTHORIZED = 401
        case NOT_FOUND = 404
        
        case INTERNAL_SERVER_ERROR = 500
    }
    
    class func generateRequestURL(baseUrl:String, queries:[String:String]) -> NSURL? {
        if (queries.count == 0) {
            return NSURL(string: baseUrl)
        }
        var url = baseUrl + "?"
        for (index, (key, value)) in queries.enumerate() {
            if let encodedValue = value.urlEncodes() {
                url += key + "=" + encodedValue
                if index != queries.count - 1 {url += "&"}
            }
        }
        
        return NSURL(string: url)
    }
}

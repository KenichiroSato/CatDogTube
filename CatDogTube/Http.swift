//
//  Http.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/25.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

class Http: NSObject {

    enum Method:String {
        case GET = "GET"
        case POST = "POST"
    }
    
    enum StatusCode: Int {
        case ok = 200
        
        case bad_REQUEST = 400
        case unauthorized = 401
        case not_FOUND = 404
        
        case internal_SERVER_ERROR = 500
    }
    
    class func generateRequestURL(_ baseUrl:String, queries:[String:String]) -> URL? {
        if (queries.count == 0) {
            return URL(string: baseUrl)
        }
        var url = baseUrl + "?"
        for (index, (key, value)) in queries.enumerated() {
            if let encodedValue = value.urlEncodes() {
                url += key + "=" + encodedValue
                if index != queries.count - 1 {url += "&"}
            }
        }
        
        return URL(string: url)
    }
}

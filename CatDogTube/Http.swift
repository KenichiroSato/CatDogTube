//
//  Http.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/25.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import Extension

class Http: NSObject {

    enum Method:String {
        case GET = "GET"
        case POST = "POST"
    }
    
    enum StatusCode: Int {
        case ok = 200
        
        case badRequest = 400
        case unauthorized = 401
        case notFound = 404
        
        case internalServerError = 500
    }
    
    class func generateRequestURL(_ baseUrl:String, queries:[String:String]) -> URL? {
        if (queries.count == 0) {
            return URL(string: baseUrl)
        }
        var url = baseUrl + "?"
        for (index, dic) in queries.enumerated() {
            if let encodedValue = dic.value.urlEncodes() {
                url += dic.key + "=" + encodedValue
                if index != queries.count - 1 {url += "&"}
            }
        }
        
        return URL(string: url)
    }
}

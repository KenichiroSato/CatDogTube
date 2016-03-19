//
//  YouTubeLauncher.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/19.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class YouTubeLauncher: NSObject {

    static private let BASE_URL = "http://www.youtube.com/watch?v="
    
    /**
     Launch YouTube with given videoId. 
     If YouTube app is not installed, Safari will be launched instead.
     - parameter videoId: videoId of content
     */
    class func open(videoId:String) {
        let urlString = YouTubeLauncher.BASE_URL + videoId
        if let url = NSURL(string: urlString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}

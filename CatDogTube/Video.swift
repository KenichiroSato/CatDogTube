//
//  Video.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 Video model which is used Domain layer and Presentation layer 
 */
class Video: NSObject {
    
    let videoId:String
    let title:String
    let imageUrl:NSURL
    let contentType:ContentType
    
    init(id:String, title:String, url:NSURL, type:ContentType) {
        self.videoId = id
        self.title = title
        self.imageUrl = url
        self.contentType = type
    }

    override var description: String {
        get {return (videoId + "\n" +
            title + "\n" +
            imageUrl.description + "\n" +
            contentType.keyword() )}
    }
    
}

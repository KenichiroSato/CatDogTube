//
//  Video.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 Video model which is used Domain layer and Presentation layer 
 */
public class Video: NSObject {
    
    public let videoId:String
    public let title:String
    public let imageUrl:URL
    public let contentType:ContentType
    
    init(id:String, title:String, url:URL, type:ContentType) {
        self.videoId = id
        self.title = title
        self.imageUrl = url
        self.contentType = type
    }

    override public var description: String {
        get {return (videoId + "\n" +
            title + "\n" +
            imageUrl.description
            )}
    }
    
}

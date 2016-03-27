//
//  VideoEntity.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 row entity of Video item which is retrieved from server.
 This must be used only in Data layer and must not be used
 in Domain layer and Presentaton layer.
 */
class VideoEntity: NSObject {

    let videoId:String
    let title:String
    let imageUrl:String
    
    init(id:String, title:String, url:String) {
        self.videoId = id
        self.title = title
        self.imageUrl = url
    }
    
    override var description: String {
        get {return (videoId + "\n" + title + "\n" + imageUrl + "\n")}
    }
 
}

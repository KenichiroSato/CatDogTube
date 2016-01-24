//
//  Video.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    let videoId:String
    let title:String
    let imageUrl:NSURL
    
    init(id:String, title:String, url:NSURL) {
        self.videoId = id
        self.title = title
        self.imageUrl = url
    }

    override var description: String {
        get {return (videoId + "\n" + title + "\n" + imageUrl.description + "\n")}
    }
    
}

//
//  YouTubeDataParser.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SwiftyJSON

class YouTubeDataParser: NSObject {

    static func parseResponse(data: NSData) -> [VideoEntity] {
        let json = JSON(data: data)
        
        var videos:[VideoEntity] = []
        
        for (_, subJson):(String, JSON) in json["items"] {
            let snippet = subJson["snippet"]
            
            if let videoId = subJson["id"]["videoId"].string,
                let title = snippet["title"].string,
                let url = snippet["thumbnails"]["high"]["url"].string{
                    let video = VideoEntity(id: videoId, title: title, url: url)
                    videos.append(video)
            }
        }
        return videos
    }
}

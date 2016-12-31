//
//  YouTubeDataParser.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import SwiftyJSON
import CatDogTubeDomain

class YouTubeDataParser: NSObject {

    static func parseResponse(_ data: Data) -> [YouTubeVideo] {
        let json = JSON(data: data)
        
        var videos:[YouTubeVideo] = []
        
        for (_, subJson):(String, JSON) in json["items"] {
            let snippet = subJson["snippet"]
            
            if let videoId = subJson["id"]["videoId"].string,
                let title = snippet["title"].string,
                let url = snippet["thumbnails"]["high"]["url"].string{
                    let video = YouTubeVideo(id: videoId, title: title, url: url)
                    videos.append(video)
            }
        }
        return videos
    }
}

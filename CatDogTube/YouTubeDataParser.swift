//
//  YouTubeDataParser.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SwiftyJSON

class YouTubeDataParser: UIImageView {

    static func parseResponse(data: NSData) -> [Video] {
        let json = JSON(data: data)
        
        var videos:[Video] = []
        
        for (_, subJson):(String, JSON) in json["items"] {
            let snippet = subJson["snippet"]
            
            if let videoId = subJson["id"]["videoId"].string,
                let title = snippet["title"].string,
                let urlString = snippet["thumbnails"]["high"]["url"].string,
                let url = NSURL(string: urlString){
                    let video = Video(id: videoId, title: title, url: url)
                    videos.append(video)
            }
        }
        return videos
    }

}

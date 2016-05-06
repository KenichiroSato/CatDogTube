//
//  VideoTranslater.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 This class translates YouTubeVideo(which is used in Data layer) into
 Video(which is used in Domain/Presentation layer)
 */
class  VideoTranslater: NSObject {
    
    class func translate(videos:[YouTubeVideo]?, contentType:ContentType) -> [Video]? {
        return videos?.flatMap({self.translateVideo($0, contentType: contentType)})
    }
    
    class private func translateVideo(entity:YouTubeVideo, contentType:ContentType) -> Video? {
        guard let url = NSURL(string: entity.imageUrl) else {
            return nil
        }
        return Video(id: entity.videoId, title:entity.title , url: url, type: contentType)
    }
    
    class func translateFavoriteVideos(videos:[FavoriteVideo]?) -> [Video]? {
        return videos?.flatMap({self.translateFavoriteVideo($0)})
    }
    
    class private func translateFavoriteVideo(entity:FavoriteVideo) -> Video? {
        guard let url = NSURL(string: entity.imageUrl),
            let contentType = ContentType(rawValue: entity.contentType) else {
            return nil
        }
        return Video(id: entity.videoId, title:entity.title , url: url, type: contentType)
    }
}

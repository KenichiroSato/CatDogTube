//
//  VideoTranslater.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 This class translates VideoEntity(which is used in Data layer) into
 Video(which is used in Domain/Presentation layer)
 */
class  VideoTranslater: NSObject {
    
    class func translate(videos:[VideoEntity]) -> [Video] {
        return videos.flatMap({self.translateVideo($0)})
    }
    
    class private func translateVideo(entity:VideoEntity) -> Video? {
        guard let url = NSURL(string: entity.imageUrl) else {
            return nil
        }
        return Video(id: entity.videoId, title:entity.title , url: url)
    }
    
}

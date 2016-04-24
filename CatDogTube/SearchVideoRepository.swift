//
//  SearchVideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

protocol SearchVideoDataSourceProtocol {
    func searchVideos(searchWord:String, completionHandler: (videos:[YouTubeVideo]?) -> Void)
}

class SearchVideoRepository: NSObject {

    let dataSource : SearchVideoDataSourceProtocol
    
    init(dataSource:SearchVideoDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    func searchVideos(keyword:String, contentType:ContentType,
                      completionHandler: (videos:[Video]?) -> Void) {
        dataSource.searchVideos(keyword, completionHandler:{ videoEntities in
            guard let nonNilVideos = videoEntities  else {
                completionHandler(videos: nil)
                return
            }
            let videos = VideoTranslater.translate(nonNilVideos, contentType:contentType)
            completionHandler(videos: videos)
        })
    }
}

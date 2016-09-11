//
//  SearchVideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol SearchVideoDataSourceProtocol {
    func searchVideos(_ searchWord:String, completionHandler: @escaping (_ videos:[YouTubeVideo]?) -> Void)
}

class SearchVideoRepository: NSObject, SearchVideoRepositoryProtocol {

    let dataSource : SearchVideoDataSourceProtocol
    
    init(dataSource:SearchVideoDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    func searchVideos(_ keyword:String, contentType:ContentType,
                      completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        dataSource.searchVideos(keyword, completionHandler:{ videoEntities in
            let videos = VideoTranslater.translate(videoEntities, contentType:contentType)
            completionHandler(videos)
        })
    }
}

//
//  SearchVideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SearchVideoDataSourceProtocol {
    func searchVideos(_ searchWord:String, completionHandler: @escaping (_ videoEntities:[YouTubeVideo]?) -> Void)
}

public class SearchVideoRepository: NSObject, SearchVideoRepositoryProtocol {

    let dataSource : SearchVideoDataSourceProtocol
    
    public init(dataSource:SearchVideoDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    public func searchVideos(_ keyword:String, contentType:ContentType,
                      completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        dataSource.searchVideos(keyword, completionHandler:{ videoEntities in
            let videos = VideoTranslater.translate(videoEntities, contentType:contentType)
            completionHandler(videos)
        })
    }
}

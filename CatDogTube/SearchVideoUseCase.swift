//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol SearchVideoRepositoryProtocol {
    func searchVideos(keyword:String, contentType: ContentType, completionHandler:(videos:[Video]?) -> Void)
}

class SearchVideoUseCase: NSObject, LoadVideoUseCase {

    private let repository:SearchVideoRepositoryProtocol
    
    private let contentType: ContentType
    
    init(content: ContentType, repo:SearchVideoRepositoryProtocol) {
        contentType = content
        repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
        repository.searchVideos(contentType.keyword(), contentType: contentType,
                                completionHandler: { videos in
            let okVideos = VideoExcluder.excludeInappropriateVideos(videos)
            completionHandler(videos: okVideos)
        })
    }
}

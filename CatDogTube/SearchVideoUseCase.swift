//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol SearchVideoRepositoryProtocol {
    func searchVideos(_ keyword:String, contentType: ContentType, completionHandler:(_ videos:[Video]?) -> Void)
}

class SearchVideoUseCase: NSObject, LoadVideoUseCase {

    fileprivate let repository:SearchVideoRepositoryProtocol
    
    fileprivate let contentType: ContentType
    
    init(content: ContentType, repo:SearchVideoRepositoryProtocol) {
        contentType = content
        repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(_ completionHandler: (_ videos:[Video]?) -> Void) {
        repository.searchVideos(contentType.keyword(), contentType: contentType,
                                completionHandler: { videos in
            let okVideos = VideoExcluder.excludeInappropriateVideos(videos)
            completionHandler(videos: okVideos)
        })
    }
}

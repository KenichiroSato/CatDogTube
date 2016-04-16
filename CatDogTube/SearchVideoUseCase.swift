//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

class SearchVideoUseCase: NSObject, LoadVideoUseCase {

    private let repository:SearchVideoRepository
    
    private let contentType: ContentType
    
    init(content: ContentType, repo:SearchVideoRepository) {
        contentType = content
        repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
        repository.searchVideos(contentType.keyword(), completionHandler: {
            videoEntities in
            guard let nonNilVideos = videoEntities  else {
                completionHandler(videos: nil)
                return
            }
            let videos = VideoTranslater.translate(nonNilVideos, contentType: self.contentType)
            completionHandler(videos: videos)
        })
    }
    
}

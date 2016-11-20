//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol SearchVideoRepositoryProtocol {
    func searchVideos(_ keyword:String, contentType: ContentType, completionHandler: @escaping (_ videos:[Video]?) -> Void)
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
    func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        Thread.dispatchAsyncGlobal(){
            self.repository.searchVideos(
                self.contentType.keyword(), contentType: self.contentType,
                completionHandler: { videos in
                    let okVideos = VideoExcluder.excludeInappropriateVideos(videos)
                    Thread.dispatchAsyncMain {
                        completionHandler(okVideos)
                    }
            })
        }
    }
}

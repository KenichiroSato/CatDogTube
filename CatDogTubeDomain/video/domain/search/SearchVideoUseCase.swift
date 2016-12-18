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
    
    private let searchWordProvider: SearchWordProviderProtocol
    
    init(content: ContentType,
         repo:SearchVideoRepositoryProtocol,
        wordProvider: SearchWordProviderProtocol) {
        contentType = content
        repository = repo
        searchWordProvider = wordProvider
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        repository.searchVideos(searchWordProvider.searchWord(for: contentType),
                                contentType: contentType) { videos in
            let okVideos = VideoExcluder.excludeInappropriateVideos(videos)
            completionHandler(okVideos)
        }
    }
}

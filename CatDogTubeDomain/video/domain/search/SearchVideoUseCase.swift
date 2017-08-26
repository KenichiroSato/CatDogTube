//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SearchVideoRepositoryProtocol {
    func searchVideos(_ keyword:String,
                      contentType: ContentType,
                      token: String?,
                      completionHandler: @escaping (_ videos:[Video]?, _ token: String?) -> Void)
}

public class SearchVideoUseCase: NSObject, LoadVideoUseCase {

    private let repository:SearchVideoRepositoryProtocol
    
    private let contentType: ContentType
    
    private let searchWordProvider: SearchWordProviderProtocol
    
    public init(content: ContentType,
         repo:SearchVideoRepositoryProtocol,
        wordProvider: SearchWordProviderProtocol) {
        contentType = content
        repository = repo
        searchWordProvider = wordProvider
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    public func loadVideos(token: String?,
                           completionHandler: @escaping (_ videos:[Video]?, _ token: String?) -> Void) {
        repository.searchVideos(searchWordProvider.searchWord(for: contentType),
                                contentType: contentType, token: token) { (videos, token) in
            let okVideos = VideoExcluder.excludeInappropriateVideos(videos)
            completionHandler(okVideos, token)
        }
    }
}

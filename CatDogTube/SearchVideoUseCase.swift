//
//  VideoListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

class SearchVideoUseCase: NSObject {

    private let repository:SearchVideoRepository
    
    init(repo:SearchVideoRepository) {
        repository = repo
        super.init()
    }
    
    func searchVideos(keyword:String, completionHandler: (videos:[Video]?) -> Void) {
        repository.searchVideos(keyword, completionHandler: {
            videoEntities in
            guard let nonNilVideos = videoEntities  else {
                completionHandler(videos: nil)
                return
            }
            let videos = VideoTranslater.translate(nonNilVideos)
            completionHandler(videos: videos)
        })
    }
    
}

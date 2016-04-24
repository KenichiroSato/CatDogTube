//
//  FavoriteListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class FavoriteListUseCase: NSObject, LoadVideoUseCase {

    private let repository: FavoritesRepositoryProtocol
    
    init(repo:FavoritesRepositoryProtocol) {
        self.repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
        repository.loadVideos({ favoriteVideos in
            let videos = VideoTranslater.translateFavoriteVideos(favoriteVideos)
            completionHandler(videos: videos)
        })
    }
    
    func saveFavorite(video:Video) -> Bool {
        return repository.saveVideo(video.videoId, title: video.title, imageUrl:
            video.imageUrl.absoluteString, contentType: video.contentType.rawValue)
    }

}

//
//  FavoriteListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class FavoriteListUseCase: NSObject, LoadVideoUseCase {

    static func create() -> FavoriteListUseCase {
        return FavoriteListUseCase(repo: FavoritesRepository(dataSource: FavoritesDatasource()))
    }
    
    private let repository: FavoritesRepository
    
    init(repo:FavoritesRepository) {
        self.repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
        repository.loadVideos() { videos in
            completionHandler(videos: videos)
        }
    }
    
    func saveFavorite(video:Video) -> Bool {
        return repository.saveFavorite(video)
    }

}

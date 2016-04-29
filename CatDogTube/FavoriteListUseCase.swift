//
//  FavoriteListUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func loadFavorites(completionHandler: (videos:[Video]?) -> Void)
    func saveFavorite(video:Video) -> Bool
}

class FavoriteListUseCase: NSObject, LoadVideoUseCase {

    static func create() -> FavoriteListUseCase {
        return FavoriteListUseCase(repo: FavoritesRepository(dataSource: FavoritesDatasource()))
    }
    
    private let repository: FavoritesRepositoryProtocol
    
    init(repo:FavoritesRepositoryProtocol) {
        self.repository = repo
        super.init()
    }
    
    // MARK: - LoadVideoUseCase
    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
        repository.loadFavorites() { videos in
            completionHandler(videos: videos)
        }
    }
    
    func saveFavorite(video:Video) -> Bool {
        return repository.saveFavorite(video)
    }

}

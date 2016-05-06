//
//  VideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol FavoritesDataSourceProtocol {
    func loadVideos(completionHandler: (videos:[FavoriteVideo]?) -> Void)
    func saveFavorite(videoId:String, title:String, imageUrl:String, contentType:Int16) -> Bool
}

class FavoritesRepository: NSObject, FavoritesRepositoryProtocol {
    
    let dataSource : FavoritesDataSourceProtocol
    
    init(dataSource:FavoritesDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    // MARK: - FavoritesRepositoryProtocol
    func loadFavorites(completionHandler: (videos: [Video]?) -> Void) {
        dataSource.loadVideos() { favoriteVideos in
            let videos = VideoTranslater.translateVideos(favoriteVideos)
            completionHandler(videos: videos)
        }
    }
    
    func saveFavorite(video:Video) -> Bool {
        return dataSource.saveFavorite(video.videoId, title: video.title, imageUrl:
            video.imageUrl.absoluteString, contentType: video.contentType.rawValue)
    }
}

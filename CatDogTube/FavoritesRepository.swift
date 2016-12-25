//
//  VideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
/*
protocol FavoritesDataSourceProtocol {
    func loadVideos(_ completionHandler: (_ videos:[FavoriteVideo]?) -> Void)
    func saveFavorite(_ videoId:String, title:String, imageUrl:String, contentType:Int16) -> Bool
}

class FavoritesRepository: NSObject, FavoritesRepositoryProtocol {
    
    let dataSource : FavoritesDataSourceProtocol
    
    init(dataSource:FavoritesDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    // MARK: - FavoritesRepositoryProtocol
    func loadFavorites(_ completionHandler: (_ videos: [Video]?) -> Void) {
        dataSource.loadVideos() { favoriteVideos in
            let videos = VideoTranslater.translateVideos(favoriteVideos)
            completionHandler(videos)
        }
    }
    
    func saveFavorite(_ video:Video) -> Bool {
        let imageUrlString = video.imageUrl.absoluteString
        
        return dataSource.saveFavorite(video.videoId, title: video.title, imageUrl:
            imageUrlString, contentType: video.contentType.rawValue)
    }
}
*/

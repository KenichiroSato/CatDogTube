//
//  FavoritesDataStore.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

class DummyFavoritesRepository: NSObject, FavoritesRepositoryProtocol {

    func loadFavorites(_ completionHandler: (_ videos:[Video]?) -> Void) {
     
        let videos =  [
            Video(id: "k6X2wJ6L0SY", title:"Three Little Kittens" , url: URL(string:"https://i.ytimg.com/vi/k6X2wJ6L0SY/hqdefault.jpg")! as URL, type: ContentType.cat),
            Video(id: "8rSH8-pbHZ0", title:"Kittens Meet Puppies For The First Time" , url: URL(string:"https://i.ytimg.com/vi/8rSH8-pbHZ0/hqdefault.jpg")!, type: ContentType.cat),
            Video(id: "Ndbe8XbpYVc", title:"Cutest Rescue Puppy and Kitten Are Best Friends" , url: URL(string:"https://i.ytimg.com/vi/Ndbe8XbpYVc/hqdefault.jpg")!, type: ContentType.cat),
            Video(id: "Y0ol5HPlPlA", title:"Cutest Video Ever!" , url: URL(string:"https://i.ytimg.com/vi/Y0ol5HPlPlA/hqdefault.jpg")!, type: ContentType.cat),
                        ]
        completionHandler(videos)
    }
    
    func saveFavorite(_ video: Video) -> Bool {
        return true
    }
}

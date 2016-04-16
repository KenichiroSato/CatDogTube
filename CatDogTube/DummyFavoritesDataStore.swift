//
//  FavoritesDataStore.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class DummyFavoritesDataStore: NSObject, VideoRepository {

    func loadVideos(completionHandler: (videos:[Video]?) -> Void) {
     
        let videos =  [
            Video(id: "k6X2wJ6L0SY", title:"Three Little Kittens" , url: NSURL(string:"https://i.ytimg.com/vi/k6X2wJ6L0SY/hqdefault.jpg")!, type: ContentType.CAT),
            Video(id: "8rSH8-pbHZ0", title:"Kittens Meet Puppies For The First Time" , url: NSURL(string:"https://i.ytimg.com/vi/8rSH8-pbHZ0/hqdefault.jpg")!, type: ContentType.CAT),
            Video(id: "Ndbe8XbpYVc", title:"Cutest Rescue Puppy and Kitten Are Best Friends" , url: NSURL(string:"https://i.ytimg.com/vi/Ndbe8XbpYVc/hqdefault.jpg")!, type: ContentType.CAT),
            Video(id: "Y0ol5HPlPlA", title:"Cutest Video Ever!" , url: NSURL(string:"https://i.ytimg.com/vi/Y0ol5HPlPlA/hqdefault.jpg")!, type: ContentType.CAT),
                        ]
        completionHandler(videos: videos)
    }
}

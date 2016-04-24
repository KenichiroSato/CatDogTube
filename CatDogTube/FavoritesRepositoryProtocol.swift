//
//  VideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func loadVideos(completionHandler: (videos:[FavoriteVideo]?) -> Void)
}
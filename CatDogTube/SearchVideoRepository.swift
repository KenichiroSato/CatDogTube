//
//  VideoListRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol SearchVideoRepository {
    func searchVideos(searchWord:String, completionHandler: (videos:[VideoEntity]?) -> Void)
}

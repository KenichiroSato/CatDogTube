//
//  UseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol LoadVideoUseCase {
    
    func loadVideos(token: String?,
                    completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)
    
}

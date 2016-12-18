//
//  UseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol LoadVideoUseCase {
    
    func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void)
    
}

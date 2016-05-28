//
//  PlayVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/06.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol PlayVideoDelegate {
    
    /**
     - returns: true when play succeed, false if fail
     */
    func playVideo(video:Video) -> Bool
}

class PlayVideoPresenter: NSObject {
    
    var playVideoDelegate: PlayVideoDelegate?
    
    func playVideo(video: Video) -> Bool {
        return playVideoDelegate?.playVideo(video) ?? false
    }
    
}

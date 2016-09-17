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
    func playVideo(_ video:Video) -> Bool
}

protocol VideoListStatusDelegate {
    func onListLoadFinished(_ videos: [Video], isForeground: Bool)
    
    func onItemTapped(_ video: Video)
}

class PlayVideoPresenter: NSObject, VideoListStatusDelegate {
    
    var playVideoDelegate: PlayVideoDelegate?
    
    fileprivate var hasVideoPlayed = false
    
    func onItemTapped(_ video: Video) {
        playVideo(video)
    }
    
    func onListLoadFinished(_ videos: [Video], isForeground: Bool) {
        guard let video = videos.first else { return }
        if shouldPlayVideo(hasVideoPlayed, isForeground: isForeground) {
            playVideo(video)
        }
    }
    
    func shouldPlayVideo(_ hasPlayed: Bool, isForeground: Bool) -> Bool {
        if (!hasPlayed && isForeground) {
            return true
        }
        return false
    }
    
    fileprivate func playVideo(_ video: Video) {
        hasVideoPlayed = true
        _ = playVideoDelegate?.playVideo(video)
    }

}

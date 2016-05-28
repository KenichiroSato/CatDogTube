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

protocol VideoListStatusDelegate {
    func onListLoadFinished(videos: [Video], isForeground: Bool)
    
    func onItemTapped(video: Video)
}

class PlayVideoPresenter: NSObject, VideoListStatusDelegate {
    
    var playVideoDelegate: PlayVideoDelegate?
    
    private var hasVideoPlayed = false
    
    func onItemTapped(video: Video) {
        playVideo(video)
    }
    
    func onListLoadFinished(videos: [Video], isForeground: Bool) {
        guard let video = videos.first else { return }
        if shouldPlayVideo(hasVideoPlayed, isForeground: isForeground) {
            playVideo(video)
        }
    }
    
    func shouldPlayVideo(hasPlayed: Bool, isForeground: Bool) -> Bool {
        if (!hasPlayed && isForeground) {
            return true
        }
        return false
    }
    
    private func playVideo(video: Video) {
        hasVideoPlayed = true
        playVideoDelegate?.playVideo(video)
    }

}

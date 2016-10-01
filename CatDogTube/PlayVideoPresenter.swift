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
     call this when video is played for the first time
     This will initialize the video module
     - returns: true when play succeed, false if fail
     */
    func loadPlayerView(with videoId: String) -> Bool
    

    /**
     Call this when video module is already initialized.
     */
    func loadVideo(with videoId: String)
    
}

protocol VideoListStatusDelegate {
    func onListLoadFinished(_ videos: [Video], isForeground: Bool)
    
    func onItemTapped(_ video: Video)
}

class PlayVideoPresenter: NSObject, VideoListStatusDelegate {
    
    var playVideoDelegate: PlayVideoDelegate?
    
    private var hasVideoPlayed = false
    
    func onItemTapped(_ video: Video) {
        play(video:video)
    }
    
    func onListLoadFinished(_ videos: [Video], isForeground: Bool) {
        guard let video = videos.first else { return }
        if shouldPlayVideo(hasVideoPlayed, isForeground: isForeground) {
            play(video:video)
        }
    }
    
    func shouldPlayVideo(_ hasPlayed: Bool, isForeground: Bool) -> Bool {
        if (!hasPlayed && isForeground) {
            return true
        }
        return false
    }
    
    private func play(video: Video) {
        if (!hasVideoPlayed) {
            hasVideoPlayed = (playVideoDelegate?.loadPlayerView(with: video.videoId))!
        } else {
            playVideoDelegate?.loadVideo(with: video.videoId)
        }
    }

}

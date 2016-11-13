//
//  PlayVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/06.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation
import youtube_ios_player_helper

protocol PlayVideoDelegate {

    /**
     call this when video is played for the first time
     This will initialize the video module
     - returns: true when play succeed, false if fail
     */
    func loadPlayerView(with videoId: String, delegate:YTPlayerViewDelegate) -> Bool
    

    /**
     Call this when video module is already initialized.
     */
    func loadVideo(with videoId: String)
    
    func play()
    
    func pause()
    
    func showPlayer()
    
}

protocol VideoListStatusDelegate {
    func onListLoadFinished(_ videos: [Video], isForeground: Bool)
    
    func onItemTapped(_ video: Video)
}

class PlayVideoPresenter: NSObject, VideoListStatusDelegate, YTPlayerViewDelegate {
    
    var playVideoDelegate: PlayVideoDelegate?
    
    private var hasPlayed = false
    
    func onItemTapped(_ video: Video) {
        play(video:video)
    }
    
    func onListLoadFinished(_ videos: [Video], isForeground: Bool) {
        guard let video = videos.first else { return }
        if shouldPlayVideo(hasPlayed, isForeground: isForeground) {
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
        if (!hasPlayed) {
            hasPlayed = playVideoDelegate?.loadPlayerView(with: video.videoId, delegate: self) ?? false
        } else {
            playVideoDelegate?.loadVideo(with: video.videoId)
        }
    }

    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playVideoDelegate?.play()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .playing,
             .unstarted: //If app cannot play the video, status becomes .Unstarted
            playVideoDelegate?.showPlayer()
        default:
            break
        }
    }

}

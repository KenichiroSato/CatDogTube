//
//  PlayVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/06.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import youtube_ios_player_helper

class PlayVideoPresenter: NSObject, PlayerContract_Presenter, YTPlayerViewDelegate {
    
    var playVideoDelegate: PlayerContract_View?
    
    private var hasPlayed = false
    
    // MARK: PlayerContract_Presenter
    func onVideoTapped(_ video: Video) {
        play(video:video)
    }
    
    func onVideoLoaded(_ videos: [Video], isForeground: Bool) {
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

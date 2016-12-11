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
    
    var view: PlayerContract_View
    
    private var hasPlayed = false
    
    init(view: PlayerContract_View) {
        self.view = view
        super.init()
    }
    
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
            hasPlayed = view.loadPlayerView(with: video.videoId, delegate: self)
        } else {
            view.loadVideo(with: video.videoId)
        }
    }

    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        view.play()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .playing,
             .unstarted: //If app cannot play the video, status becomes .Unstarted
            view.showPlayer()
        default:
            break
        }
    }

}

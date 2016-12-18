//
//  PlayVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/06.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

class PlayVideoPresenter: NSObject, PlayerContract_Presenter {
    
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
    
    func onVideoLoaded(_ videos: [Video]) {
        guard let video = videos.first else { return }
        if shouldPlayVideo(hasPlayed) {
            play(video:video)
        }
    }
    
    func shouldPlayVideo(_ hasPlayed: Bool) -> Bool {
        if (!hasPlayed) {
            return true
        }
        return false
    }
    
    private func play(video: Video) {
        if (!hasPlayed) {
            hasPlayed = view.loadPlayerView(with: video.videoId)
        } else {
            view.loadVideo(with: video.videoId)
        }
    }

}

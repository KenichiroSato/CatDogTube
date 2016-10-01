//
//  PlayerVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/30.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PlayerVC: UIViewController, YTPlayerViewDelegate, PlayVideoDelegate {
    
    static let ID = "PlayerVC"

    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        
        hidePlayer()
    }
    
    private func showPlayer() {
        playerView.isHidden = false
        activityIndicator.isHidden = true
    }
    
    private func hidePlayer() {
        playerView.isHidden = true
        activityIndicator.isHidden = false
    }

    // MARK: - PlayVideoDelegate
    func loadPlayerView(with videoId: String) -> Bool {
        return playerView.load(withVideoId: videoId, playerVars: ["playsinline":1])
    }
    
    func loadVideo(with videoId: String) {
        playerView.loadVideo(byId: videoId, startSeconds: 0.0, suggestedQuality: .auto)
    }
    
    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView!) {
        playerView.playVideo()
    }
    
    func playerView(_ playerView: YTPlayerView!, didChangeTo state: YTPlayerState) {
        switch state {
        case .playing,
             .unstarted: //If app cannot play the video, status becomes .Unstarted
            showPlayer()
        default:
            break
        }
    }
    
}

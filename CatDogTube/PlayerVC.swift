//
//  PlayerVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/30.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import CatDogTubeDomain

class PlayerVC: UIViewController, PlayerContract_View, YTPlayerViewDelegate {
    
    static let ID = "PlayerVC"

    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidePlayer()
    }
    
    private func hidePlayer() {
        playerView.isHidden = true
        activityIndicator.isHidden = false
    }

    // MARK: - PlayerContract_View
    func loadPlayerView(with videoId: String) -> Bool {
        playerView.delegate = self
        return playerView.load(withVideoId: videoId, playerVars: ["playsinline":1])
    }
    
    func loadVideo(with videoId: String) {
        playerView.loadVideo(byId: videoId, startSeconds: 0.0, suggestedQuality: .auto)
    }

    func showPlayer() {
        playerView.isHidden = false
        activityIndicator.isHidden = true
    }
    
    func play() {
         playerView.playVideo()
    }
    
    func pause() {
        playerView.pauseVideo()
    }
    
    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        play()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .playing,
             .unstarted: //If app cannot play the video, status becomes .Unstarted
            showPlayer()
        default:
            break
        }
    }

}

//
//  PlayerVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/30.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PlayerVC: UIViewController, PlayerContract_View {
    
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
    func loadPlayerView(with videoId: String, delegate: YTPlayerViewDelegate) -> Bool {
        playerView.delegate = delegate
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
}

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
    
    var video:Video?
    fileprivate var isLoaded:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        
        hidePlayer()
        
        isLoaded = loadVideo()
    }
    
    fileprivate func showPlayer() {
        playerView.isHidden = false
        activityIndicator.isHidden = true
    }
    
    fileprivate func hidePlayer() {
        playerView.isHidden = true
        activityIndicator.isHidden = false
    }
    
    // return false if failed
    fileprivate func loadVideo() -> Bool {
        guard let nonNilVideo = video else { return false }
        return playerView.load(withVideoId: nonNilVideo.videoId, playerVars:  ["playsinline":1])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - PlayVideoDelegate
    func playVideo(_ video: Video) -> Bool {
        self.video = video
        isLoaded = loadVideo()
        return isLoaded
    }

    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: YTPlayerView!) {
        if isLoaded {
            playerView.playVideo()
        } else {
            print ("TODO error")
        }
    }
    
    func playerView(_ playerView: YTPlayerView!, didChangeTo state: YTPlayerState) {
        switch state {
        case .playing,
             .unstarted: //If app cannot play the video, status becomes .Unstarted
            showPlayer()
        case .ended:
            dismissModally()
        default:
            break
        }
    }
    
}

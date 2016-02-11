//
//  PlayerVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/30.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PlayerVC: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var video:Video?
    private var isLoaded:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        hidePlayer()
        
        isLoaded = loadVideo()
    }
    
    private func showPlayer() {
        playerView.hidden = false
        activityIndicator.hidden = true
    }
    
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissModally()
    }
    
    private func hidePlayer() {
        playerView.hidden = true
        activityIndicator.hidden = false
    }
    
    // return false if failed
    private func loadVideo() -> Bool {
        guard let nonNilVideo = video else { return false }
        return playerView.loadWithVideoId(nonNilVideo.videoId, playerVars:  ["playsinline":1])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - YTPlayerViewDelegate
    func playerViewDidBecomeReady(playerView: YTPlayerView!) {
        if isLoaded {
            playerView.playVideo()
        } else {
            print ("TODO error")
        }
    }
    
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        switch state {
        case .Playing,
             .Unstarted: //If app cannot play the video, status becomes .Unstarted
            showPlayer()
        case .Ended:
            dismissModally()
        default:
            break
        }
    }
    
}

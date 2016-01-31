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
    
    var video:Video?
    private var isLoaded:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        
        isLoaded = loadVideo()
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if isLoaded {
            playerView.playVideo()
        } else {
            print ("TODO error")
        }
    }
    
    @IBAction func onBackPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
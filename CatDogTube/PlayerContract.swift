//
//  PlayContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import youtube_ios_player_helper

protocol PlayerContract_View {

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

protocol PlayerContract_Presenter {
    func showVideo(with videoId:String)
}

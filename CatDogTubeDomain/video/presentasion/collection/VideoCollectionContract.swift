//
//  VideoCollectionContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol VideoCollectionContract_View: SegmentContract_View {
    
    func set(presenter: VideoCollectionContract_Presenter)
    
    func show(videos:[Video])
    
    func showErrorUI()
    
    func hideErrorUI()
    
    func showLoadingIndicator()

}

public protocol VideoCollectionContract_Presenter: SegmentContract_Presenter {
    
    func loadVideo(withFullScreenIndicator:Bool)
 
    func onVideoTapped(_ video: Video)
}

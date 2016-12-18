//
//  VideoCollectionContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol VideoCollectionContract_View: SegmentContract_View {
    
    func show(videos:[Video])
    
    func showErrorUI()
    
    func hideErrorUI()
    
    func showLoadingIndicator()

}

protocol VideoCollectionContract_Presenter: SegmentContract_Presenter {
    
    func set(view: VideoCollectionContract_View)
    
    func loadVideo(withFullScreenIndicator:Bool)
 
    //func onSegmentChanged(isForeground:Bool)
    func markAsPrimal()
    
    func onVideoTapped(_ video: Video)
}

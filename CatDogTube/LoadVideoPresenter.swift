//
//  LoadVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
 Presenter for Video list UI.
 */
class LoadVideoPresenter: NSObject, VideoCollectionContract_Presenter {
    
    private let useCase: LoadVideoUseCase
    
    private var view: VideoCollectionContract_View?
    
    var playerPresenter: PlayerContract_Presenter
    
    private let executor: ThreadExecutorProtocol
    
    private var isForeground = false
    
    init(useCase: LoadVideoUseCase, executor: ThreadExecutorProtocol, playerPresenter: PlayerContract_Presenter ) {
        self.useCase = useCase
        self.executor = executor
        self.playerPresenter = playerPresenter
        super.init()
    }
    
    private func onLoadSuccess(videos:[Video]) {
        executor.runOnMain {
            self.playerPresenter.onVideoLoaded(videos, isForeground: self.isForeground)
            self.view?.show(videos: videos)
            self.view?.hideErrorUI()
        }
    }
    
    private func onLoadFail() {
        executor.runOnMain {
            self.view?.show(videos: [])
            self.view?.showErrorUI()
        }
    }
    
    // MARK: VideoCollectionContract_Presenter
    func loadVideo(withFullScreenIndicator:Bool) {
        if (withFullScreenIndicator) {
            view?.showLoadingIndicator()
        }
        
        executor.runOnBackground {
            self.useCase.loadVideos() { videos in
                guard let nonNilVideos = videos , !nonNilVideos.isEmpty else {
                    self.onLoadFail()
                    return
                }
                self.onLoadSuccess(videos: nonNilVideos)
            }
        }
    }
    
    func set(view: VideoCollectionContract_View) {
        self.view = view
    }

    func onSegmentChanged(isForeground: Bool) {
        self.isForeground = isForeground
    }
    
    func onVideoTapped(_ video: Video) {
        playerPresenter.onVideoTapped(video)
    }
}

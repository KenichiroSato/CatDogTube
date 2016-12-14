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
    
    // If true, top contents of this presenter' view will played when app is launched.
    private var isPrimal = false
    
    init(useCase: LoadVideoUseCase, executor: ThreadExecutorProtocol, playerPresenter: PlayerContract_Presenter ) {
        self.useCase = useCase
        self.executor = executor
        self.playerPresenter = playerPresenter
        super.init()
    }
    
    private func onLoadSuccess(videos:[Video]) {
        executor.runOnMain {
            if (self.isPrimal) {
                self.playerPresenter.onVideoLoaded(videos)
            }
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

    func markAsPrimal() {
        isPrimal = true
    }
    
    func onVideoTapped(_ video: Video) {
        playerPresenter.onVideoTapped(video)
    }
}

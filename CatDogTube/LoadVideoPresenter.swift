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
    
    private let executor: ThreadExecutorProtocol
    
    init(useCase: LoadVideoUseCase, executor: ThreadExecutorProtocol ) {
        self.useCase = useCase
        self.executor = executor
        super.init()
    }
    
    private func onLoadSuccess(videos:[Video]) {
        executor.runOnMain {
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

}

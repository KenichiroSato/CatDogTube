//
//  LoadVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol LoadVideoDelegate {
    
    func set(videos:[Video])
    
    func showErrorUI()
    
    func hideErrorUI()
    
    func showLoadingIndicator()
}

/**
 Presenter for Video list UI.
 */
class LoadVideoPresenter: NSObject {
    
    private let useCase: LoadVideoUseCase
    
    var loadVideoDelegate: LoadVideoDelegate?
    
    init(useCase: LoadVideoUseCase) {
        self.useCase = useCase
        super.init()
    }
    
    func loadVideo(withFullScreenIndicator:Bool) {
        if (withFullScreenIndicator) {
            loadVideoDelegate?.showLoadingIndicator()
        }
        
        Thread.dispatchAsyncGlobal(){
            self.useCase.loadVideos() { videos in
                Thread.dispatchAsyncMain() {
                    guard let nonNilVideos = videos , !nonNilVideos.isEmpty else {
                        self.onLoadFail()
                        return
                    }
                    self.onLoadSuccess(videos: nonNilVideos)
                }
            }
        }
    }

    private func onLoadSuccess(videos:[Video]) {
        loadVideoDelegate?.set(videos: videos)
        loadVideoDelegate?.hideErrorUI()
    }
    
    private func onLoadFail() {
        loadVideoDelegate?.set(videos: [])
        loadVideoDelegate?.showErrorUI()
    }
}

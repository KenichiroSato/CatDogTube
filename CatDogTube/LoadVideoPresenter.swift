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
    
    init(useCase: LoadVideoUseCase) {
        self.useCase = useCase
        super.init()
    }
    
    private func onLoadSuccess(videos:[Video]) {
        view?.show(videos: videos)
        view?.hideErrorUI()
    }
    
    private func onLoadFail() {
        view?.show(videos: [])
        view?.showErrorUI()
    }
    
    // MARK: VideoCollectionContract_Presenter
    func loadVideo(withFullScreenIndicator:Bool) {
        if (withFullScreenIndicator) {
            view?.showLoadingIndicator()
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
    
    func set(view: VideoCollectionContract_View) {
        self.view = view
    }

}

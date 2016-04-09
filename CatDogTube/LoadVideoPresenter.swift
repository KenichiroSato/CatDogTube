//
//  LoadVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol LoadVideoDelegate {
    /*
     must be called in main thread
     */
    func onLoadSuccess(videos: [Video])

    /*
     must be called in main thread
     */
    func onLoadFail()
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
    
    func loadVideo() {
        NSThread.dispatchAsyncGlobal(){
            self.useCase.loadVideos() { videos in
                NSThread.dispatchAsyncMain() {
                    guard let nonNilVideos = videos where !nonNilVideos.isEmpty else {
                        self.loadVideoDelegate?.onLoadFail()
                        return
                    }
                    self.loadVideoDelegate?.onLoadSuccess(nonNilVideos)
                }
            }
        }
    }

}
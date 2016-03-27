//
//  LoadVideoPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol LoadVideoDelegate {
    func onLoadSuccess(videos: [Video])
    func onLoadFail()
}

class LoadVideoPresenter: NSObject {
    
    private let useCase: LoadVideoUseCase
    
    var loadVideoDelegate: LoadVideoDelegate?
    
    init(useCase: LoadVideoUseCase) {
        self.useCase = useCase
        super.init()
    }
    
    func loadVideo() {
        useCase.loadVideos() { videos in
            guard let nonNilVideos = videos where !nonNilVideos.isEmpty else {
                self.loadVideoDelegate?.onLoadFail()
                return
            }
            self.loadVideoDelegate?.onLoadSuccess(nonNilVideos)
        }
    }

}
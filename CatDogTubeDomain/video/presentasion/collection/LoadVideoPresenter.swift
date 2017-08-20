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
public class LoadVideoPresenter: NSObject, VideoCollectionContract_Presenter {
    
    private let useCase: LoadVideoUseCase
    
    private var view: VideoCollectionContract_View
    
    var playerPresenter: PlayerContract_Presenter
    
    private let executor: ThreadExecutorProtocol
    
    //Trigger the additional data load when RecyclerView scroll position is near to bottom
    private let LOAD_TRIGGER = 8
    
    private var pageToken: String?
    
    private var isLoading = false
    
    // If pagination is finished or not
    private var isLoadCompleted = false
    
    private var videoList: [Video] = []
    
    // If true, top contents of this presenter' view will played when app is launched.
    private var isPrimal = false
    
    public init(view: VideoCollectionContract_View,
                useCase: LoadVideoUseCase,
                executor: ThreadExecutorProtocol,
                playerPresenter: PlayerContract_Presenter ) {
        self.view = view
        self.useCase = useCase
        self.executor = executor
        self.playerPresenter = playerPresenter
        super.init()
        view.set(presenter: self)
    }
    
    private func onLoadSuccess(videos:[Video]) {
        executor.runOnMain {
            if (self.isPrimal) {
                self.playerPresenter.onVideoLoaded(videos)
            }
            if (videos.isEmpty) { //pagination finished
                self.isLoadCompleted = true
            } else {
                self.videoList += videos
                self.view.show(videos: self.videoList)
            }
            self.view.hideErrorUI()
            self.isLoading = false
        }
    }

    private func onLoadFail() {
        executor.runOnMain {
            self.view.show(videos: [])
            self.view.showErrorUI()
            self.clearVideos()
            self.isLoading = false
        }
    }
    
    private func clearVideos() {
        videoList.removeAll()
        pageToken = nil
    }
    
    private func isLoadSuccess(opVideos: [Video]?) -> Bool {
        guard let videos = opVideos else {
            return false
        }
        if (videos.isEmpty && pageToken == nil) {
            return false
        }
        return true
    }
    
    // MARK: VideoCollectionContract_Presenter
    public func loadVideo() {
        executor.runOnMain {
            if (self.isLoading) { return }
            self.isLoading = true
            if (self.videoList.count == 0) {
                self.view.showLoadingIndicator()
            }
            
            self.executor.runOnBackground {
                self.useCase.loadVideos(token: self.pageToken) { videos, token in
                    if (!self.isLoadSuccess(opVideos: videos)) {
                        self.onLoadFail()
                        return
                    }
                    self.pageToken = token
                    self.onLoadSuccess(videos: videos!) // videos is not nil 
                }
            }
        }
    }
    
    public func refreshVideos() {
        clearVideos()
        isLoadCompleted = false
        loadVideo()
    }
    

    public func markAsPrimal() {
        isPrimal = true
    }
    
    public func onVideoTapped(_ video: Video) {
        playerPresenter.onVideoTapped(video)
    }
    
    public func onScrolled(visiblePosition: Int) {
        if (isLoadCompleted) { return }
        if (visiblePosition > videoList.count - LOAD_TRIGGER) {
            loadVideo()
        }
    }

}

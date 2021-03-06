//
//  LoadVideoPresernterTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import XCTest
import Cuckoo
@testable import CatDogTubeDomain

class LoadVideoPresernterTests: XCTestCase {
    
    private let videos:[Video] = [
        Video(id: "1", title: "子犬のワルツ", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "2", title: "mmd video", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "3", title: "ok video", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "4", title: "ok video2", url: URL(string: "yahoo")!, type: ContentType.cat)
    ]

    private let pageToken = "CAoQAA"
    
    private var mockView: MockVideoCollectionContract_View!
    
    private var mockPlayerPresenter: MockPlayerContract_Presenter!
    
    private var mockUsecase: MockLoadVideoUseCase!
    
    override func setUp() {
        super.setUp()
        mockView = MockVideoCollectionContract_View()
        mockPlayerPresenter = MockPlayerContract_Presenter()
        mockUsecase = MockLoadVideoUseCase()
        
        stub(mockView) {mock in
            when(mock.set(presenter:any())).thenDoNothing()
            when(mock.show(videos:any())).thenDoNothing()
            when(mock.showErrorUI()).thenDoNothing()
            when(mock.hideErrorUI()).thenDoNothing()
            when(mock.showLoadingIndicator()).thenDoNothing()
        }
        
        stub(mockPlayerPresenter) { mock in
            when(mock.onVideoLoaded(any())).thenDoNothing()
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIndicator() {
        stub(mockUsecase) { mock in
            when(mock.loadVideos(token: equal(to: nil), completionHandler:any())).thenDoNothing()
        }
        let presenter = LoadVideoPresenter(view: mockView,
                                           useCase: mockUsecase,
                                           executor:DummyThreadExecutor(),
                                           playerPresenter: mockPlayerPresenter)
        presenter.loadVideo()
        
        verify(mockView).showLoadingIndicator()
    }
    
    func testLoadSuccess() {
        stub(mockUsecase) { mock in
            when(mock.loadVideos(token:equal(to:nil),
                                 completionHandler:any())).then { text, closure in
                closure(self.videos, self.pageToken)
            }
        }
        let presenter = LoadVideoPresenter(view: mockView,
                                           useCase: mockUsecase,
                                           executor:DummyThreadExecutor(),
                                           playerPresenter: mockPlayerPresenter)
        presenter.loadVideo()
        
        verify(self.mockUsecase).loadVideos(token: equal(to:nil), completionHandler:any())
        verify(self.mockView, times(0)).showErrorUI()
        verify(self.mockView, times(1)).hideErrorUI()
        verify(self.mockView).show(videos:any())
        verify(self.mockPlayerPresenter, times(0)).onVideoLoaded(any())
    }
    
    func testLoadSuccessWithPrimal() {
        stub(mockUsecase) { mock in
            when(mock.loadVideos(token:equal(to:nil),
                                 completionHandler:any())).then { token, closure in
                closure(self.videos, self.pageToken)
            }
        }
        let presenter = LoadVideoPresenter(view: mockView,
                                           useCase: mockUsecase,
                                           executor:DummyThreadExecutor(),
                                           playerPresenter: mockPlayerPresenter)
        presenter.markAsPrimal()
        presenter.loadVideo()
        
        verify(self.mockPlayerPresenter, times(1)).onVideoLoaded(any())
    }
    
    func testLoadFail() {
        stub(mockUsecase) { mock in
            when(mock.loadVideos(token:equal(to:nil),
                                 completionHandler:any())).then { token, closure in
                closure([], nil)
            }
        }
        
        let presenter = LoadVideoPresenter(view: mockView,
                                           useCase: mockUsecase,
                                           executor:DummyThreadExecutor(),
                                           playerPresenter: mockPlayerPresenter)
        presenter.loadVideo()

        verify(self.mockUsecase).loadVideos(token: equal(to:nil), completionHandler:any())
        verify(self.mockView, times(1)).showErrorUI()
        verify(self.mockView, times(0)).hideErrorUI()
        verify(self.mockView).show(videos:any())

    }
    
}

//
//  PlayVideoPresenterTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/07.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTubeDomain

class PlayVideoPresenterTests: XCTestCase {
    
    private var mockView: MockPlayerContract_View!

    var presenter: PlayVideoPresenter!
    
    override func setUp() {
        super.setUp()
        mockView = MockPlayerContract_View()
        presenter = PlayVideoPresenter(view: mockView)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldPlayVideo1() {
        let hasPlayed = false
        XCTAssertTrue(presenter.shouldPlayVideo(hasPlayed))
    }
    
    func testShouldPlayVideo2() {
        let hasPlayed = true
        XCTAssertFalse(presenter.shouldPlayVideo(hasPlayed))
    }
}

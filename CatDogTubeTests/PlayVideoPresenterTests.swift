//
//  PlayVideoPresenterTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/07.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTube

class PlayVideoPresenterTests: XCTestCase {
    
    let presenter = PlayVideoPresenter()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldPlayVideo1() {
        let hasPlayed = false
        let isForeground = false
        XCTAssertFalse(presenter.shouldPlayVideo(hasPlayed, isForeground: isForeground))
    }
    
    func testShouldPlayVideo2() {
        let hasPlayed = false
        let isForeground = true
        XCTAssertTrue(presenter.shouldPlayVideo(hasPlayed, isForeground: isForeground))
    }
    
    func testShouldPlayVideo3() {
        let hasPlayed = true
        let isForeground = false
        XCTAssertFalse(presenter.shouldPlayVideo(hasPlayed, isForeground: isForeground))
    }
    
    func testShouldPlayVideo4() {
        let hasPlayed = true
        let isForeground = true
        XCTAssertFalse(presenter.shouldPlayVideo(hasPlayed, isForeground: isForeground))
    }
}

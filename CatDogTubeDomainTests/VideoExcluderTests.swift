//
//  VideoExcluderTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/02.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import CatDogTubeDomain

class VideoExcluderTests: XCTestCase {
    
    private let videos:[Video] = [
        Video(id: "1", title: "子犬のワルツ", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "2", title: "mmd video", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "3", title: "ok video", url: URL(string: "yahoo")!, type: ContentType.cat),
        Video(id: "4", title: "ok video2", url: URL(string: "yahoo")!, type: ContentType.cat)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    func testExcludeVideo() {
        let excluded = VideoExcluder.excludeInappropriateVideos(videos)

        XCTAssertEqual(excluded!.count, 2)
        
        let video = excluded![0]
        XCTAssertEqual(video.title, "ok video")
    }

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}

//
//  VideoTranslaterTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/04.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTube

class VideoTranslaterTests: XCTestCase {

    private let nonNilVideos = [
        VideoEntity(id: "id1", title: "title1", url: "https://image1"),
        VideoEntity(id: "id2", title: "title2", url: "https://image2"),
        VideoEntity(id: "id3", title: "title3", url: "https://image3"),
        VideoEntity(id: "id4", title: "title4", url: "https://image4"),
    ]
    
    private let nilVideos = [
        VideoEntity(id: "id1", title: "title1", url: "https://image1"),
        VideoEntity(id: "id2", title: "title2", url: "https://image2"),
        VideoEntity(id: "id3", title: "title3", url: "このVideoEntityは変換できない"),
        VideoEntity(id: "id4", title: "title4", url: "https://image4"),
        ]

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNonNilCase() {
        let videos = VideoTranslater.translate(nonNilVideos)
        XCTAssertNotNil(videos)
        XCTAssertEqual(videos.count, 4)
        XCTAssertEqual(videos[2].videoId, "id3")
        XCTAssertEqual(videos[2].title, "title3")
        XCTAssertEqual(videos[2].imageUrl.description, "https://image3")
    }

    func testNilCase() {
        let videos = VideoTranslater.translate(nilVideos)
        XCTAssertNotNil(videos)
        XCTAssertEqual(videos.count, 3)
        XCTAssertEqual(videos[2].videoId, "id4")
        XCTAssertEqual(videos[2].title, "title4")
        XCTAssertEqual(videos[2].imageUrl.description, "https://image4")
    }
    

}

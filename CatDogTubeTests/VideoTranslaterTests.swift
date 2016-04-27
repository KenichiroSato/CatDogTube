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
        YouTubeVideo(id: "id1", title: "title1", url: "https://image1"),
        YouTubeVideo(id: "id2", title: "title2", url: "https://image2"),
        YouTubeVideo(id: "id3", title: "title3", url: "https://image3"),
        YouTubeVideo(id: "id4", title: "title4", url: "https://image4"),
    ]
    
    private let nilVideos = [
        YouTubeVideo(id: "id1", title: "title1", url: "https://image1"),
        YouTubeVideo(id: "id2", title: "title2", url: "https://image2"),
        YouTubeVideo(id: "id3", title: "title3", url: "このYouTubeVideoは変換できない"),
        YouTubeVideo(id: "id4", title: "title4", url: "https://image4"),
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
        let videos = VideoTranslater.translate(nonNilVideos, contentType: ContentType.CAT)
        XCTAssertNotNil(videos)
        XCTAssertEqual(videos.count, 4)
        XCTAssertEqual(videos[2].videoId, "id3")
        XCTAssertEqual(videos[2].title, "title3")
        XCTAssertEqual(videos[2].imageUrl.description, "https://image3")
        XCTAssertEqual(videos[2].contentType, ContentType.CAT)
    }

    func testNilCase() {
        let videos = VideoTranslater.translate(nilVideos, contentType: ContentType.DOG)
        XCTAssertNotNil(videos)
        XCTAssertEqual(videos.count, 3)
        XCTAssertEqual(videos[2].videoId, "id4")
        XCTAssertEqual(videos[2].title, "title4")
        XCTAssertEqual(videos[2].imageUrl.description, "https://image4")
        XCTAssertEqual(videos[2].contentType, ContentType.DOG)
    }
    

}

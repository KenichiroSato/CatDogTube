//
//  YouTubeDataParserTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import CatDogTube
@testable import CatDogTubeDomain

class YouTubeDataParserTests: XCTestCase {

    var testData:Data!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        let path : String = bundle.path(forResource: "searchResponse", ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        testData = fileHandle.readDataToEndOfFile()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testVideo() {
        let videos = YouTubeDataParser.parseResponse(testData)
        let video = videos[0]
        
        XCTAssertEqual(video.title, "Three Little Kittens")
        XCTAssertEqual(video.videoId, "k6X2wJ6L0SY")
        XCTAssertEqual(video.imageUrl, "https://i.ytimg.com/vi/k6X2wJ6L0SY/hqdefault.jpg")
    }
    
    func testCount() {
        let videos = YouTubeDataParser.parseResponse(testData)
        
        XCTAssertEqual(videos.count, 10)
    }

}

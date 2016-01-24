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

class YouTubeDataParserTests: XCTestCase {

    var testData:NSData!
    
    override func setUp() {
        super.setUp()
        
        let testBundle = NSBundle(forClass: self.dynamicType)
        let path : String = testBundle.pathForResource("searchResponse", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        testData = fileHandle.readDataToEndOfFile()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPiyo() {
        let res = YouTubeDataParser.parseTest(testData)
        XCTAssertEqual(res, "CAoQAA")
    }
    
    func testCount() {
        let videos = YouTubeDataParser.parseResponse(testData)
        
        XCTAssertEqual(videos.count, 10)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

//
//  HttpTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/28.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTube

class HttpTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoParameter() {
        let param:[String:String] = [:]
        let url = Http.generateRequestURL("https://www.googleapis.com/youtube/v3/search", queries: param)
        
        XCTAssertEqual(URL(string: "https://www.googleapis.com/youtube/v3/search"), url)
    }
    
    func testWithParameter() {
        let param:[String:String] = ["publishedAfter" : "2013-02-01T00:00:00Z"]
        let url = Http.generateRequestURL("https://www.googleapis.com/youtube/v3/search", queries: param)
        
        XCTAssertEqual(URL(string: "https://www.googleapis.com/youtube/v3/search?publishedAfter=2013-02-01T00:00:00Z"), url)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

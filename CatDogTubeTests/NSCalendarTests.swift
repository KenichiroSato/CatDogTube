//
//  DateGeneratorTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTube

class NSCalendarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testRandomYear() {
        let calender = NSCalendar.currentCalendar()
        let maxDate = calender.dateWithYear(2016, Month: 3, Day: 13)!
        let minDate = calender.dateWithYear(2011, Month: 1, Day: 1)!
        
        for _ in 0...10 {
            let randomDate = calender.randomDate(maxDate, minDate: minDate)!
            let rand = calender.simpleComponents(randomDate)
            XCTAssertLessThanOrEqual(rand.year, 2016)
            XCTAssertGreaterThanOrEqual(rand.year, 2011)
        }
    }
    
    func testRandomMonth() {
        let calender = NSCalendar.currentCalendar()
        let maxDate = calender.dateWithYear(2016, Month: 8, Day: 13)!
        let minDate = calender.dateWithYear(2016, Month: 3, Day: 1)!
        
        for _ in 0...10 {
            let randomDate = calender.randomDate(maxDate, minDate: minDate)!
            let rand = calender.simpleComponents(randomDate)
            XCTAssertLessThanOrEqual(rand.month, 8)
            XCTAssertGreaterThanOrEqual(rand.month, 3)
        }
    }
    
    func testRandomDay() {
        let calender = NSCalendar.currentCalendar()
        let maxDate = calender.dateWithYear(2016, Month: 8, Day: 23)!
        let minDate = calender.dateWithYear(2016, Month: 8, Day: 15)!
        
        for _ in 0...10 {
            let randomDate = calender.randomDate(maxDate, minDate: minDate)!
            let rand = calender.simpleComponents(randomDate)
            XCTAssertLessThanOrEqual(rand.day, 23)
            XCTAssertGreaterThanOrEqual(rand.day, 15)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

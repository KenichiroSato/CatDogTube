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
        let calendar = NSCalendar.currentCalendar()
        let maxDate = calendar.dateWithYear(2016, Month: 3, Day: 13)!
        let minDate = calendar.dateWithYear(2011, Month: 1, Day: 1)!
        
        for _ in 0...10 {
            let randomDate = calendar.randomDate(maxDate, minDate: minDate)
            let rand = calendar.components(randomDate)
            XCTAssertLessThanOrEqual(rand.year, 2016)
            XCTAssertGreaterThanOrEqual(rand.year, 2011)
        }
    }
    
    func testRandomMonth() {
        let calendar = NSCalendar.currentCalendar()
        let maxDate = calendar.dateWithYear(2016, Month: 8, Day: 13)!
        let minDate = calendar.dateWithYear(2016, Month: 3, Day: 1)!
        
        for _ in 0...10 {
            let randomDate = calendar.randomDate(maxDate, minDate: minDate)
            let rand = calendar.components(randomDate)
            XCTAssertLessThanOrEqual(rand.month, 8)
            XCTAssertGreaterThanOrEqual(rand.month, 3)
        }
    }
    
    func testRandomDay() {
        let calendar = NSCalendar.currentCalendar()
        let maxDate = calendar.dateWithYear(2016, Month: 8, Day: 23)!
        let minDate = calendar.dateWithYear(2016, Month: 8, Day: 15)!
        
        for _ in 0...10 {
            let randomDate = calendar.randomDate(maxDate, minDate: minDate)
            let rand = calendar.components(randomDate)
            XCTAssertLessThanOrEqual(rand.day, 23)
            XCTAssertGreaterThanOrEqual(rand.day, 15)
        }
    }
    
    func testOneMonthAgo() {
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateWithYear(2016, Month: 8, Day: 23)!
        
        let ago = date.daysAgo(30)
        let agoComp = calendar.components(ago)
        XCTAssertEqual(agoComp.year, 2016)
        XCTAssertEqual(agoComp.month, 7)
        XCTAssertEqual(agoComp.day, 24)
    }
    
    func testOneMonthAgo2() {
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateWithYear(2016, Month: 1, Day: 23)!
        
        let ago = date.daysAgo(30)
        let agoComp = calendar.components(ago)
        XCTAssertEqual(agoComp.year, 2015)
        XCTAssertEqual(agoComp.month, 12)
        XCTAssertEqual(agoComp.day, 24)
    }
    
}

//
//  TeamTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import XCTest
@testable import CatDogTube

class TeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTeam() {
        
        let catTeam = Team(name: "cat_team")
        XCTAssertNotNil(catTeam)
        XCTAssertFalse(catTeam!.isDogTeam())
        
        let dogTeam = Team(name: "dog_team")
        XCTAssertNotNil(dogTeam)
        XCTAssertTrue(dogTeam!.isDogTeam())
        
        let monkeyTeam = Team(name: "monkey_team")
        XCTAssertNil(monkeyTeam)
        
        
        let cat2 = Team(teamName: .catTeam)
        XCTAssertEqual(cat2.nameString(), "cat_team")
        
        let nilTeam = Team(name: nil)
        XCTAssertNil(nilTeam)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

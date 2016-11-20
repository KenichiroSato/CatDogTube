//
//  TeamRepositoryTests.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import XCTest
import Cuckoo
@testable import CatDogTube

class TeamRepositoryTests: XCTestCase {
    
    private var mock: MockTeamDataSourceProtocol!

    override func setUp() {
        super.setUp()
        
        mock = MockTeamDataSourceProtocol()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveTeam() {
        stub(mock) { mock in
            when(mock.loadTeamName()).thenReturn("cat_team")
            when(mock.save(teamName:anyString())).thenDoNothing()
        }
        
        let repo = TeamRepository(dataSource: mock)
        let team = repo.loadTeam()
        
        XCTAssertEqual(team?.nameString(), "cat_team")
        
        verify(mock).loadTeamName()
        
        let newTeam = Team(contentType:.cat)
        repo.save(team:newTeam)
        
        verify(mock).save(teamName:anyString())
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

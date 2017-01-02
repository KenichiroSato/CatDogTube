//
//  TeamRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol TeamDataSourceProtocol {
    func loadTeamName() -> String?
    func save(teamName:String)
}


public class TeamRepository: NSObject, TeamRepositoryProtocol {
    
    private let dataSource : TeamDataSourceProtocol
    
    public init(dataSource:TeamDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    // MARK: - TeamRepositoryProtocol
    public func loadTeam() -> Team? {
        return Team(name: dataSource.loadTeamName())
    }
    
    public func save(team:Team) {
        dataSource.save(teamName: team.nameString())
    }
}

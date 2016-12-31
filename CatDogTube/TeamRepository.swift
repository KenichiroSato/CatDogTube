//
//  TeamRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

protocol TeamDataSourceProtocol {
    func loadTeamName() -> String?
    func save(teamName:String)
}


class TeamRepository: NSObject, TeamRepositoryProtocol {

    private let dataSource : TeamDataSourceProtocol
    
    init(dataSource:TeamDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    // MARK: - TeamRepositoryProtocol
    func loadTeam() -> Team? {
        return Team(name: dataSource.loadTeamName())
    }
    
    func save(team:Team) {
        dataSource.save(teamName: team.nameString())
    }
}

//
//  TeamUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol TeamRepositoryProtocol {
    func loadTeam() -> Team?
    func save(team:Team)
}

class TeamUseCase: NSObject {

    private let repo: TeamRepositoryProtocol
    
    static func create() -> TeamUseCase {
        let dataSource = UserDefaultsDataSource()
        let repo = TeamRepository(dataSource: dataSource)
        return TeamUseCase(repo: repo)
    }
    
    init(repo:TeamRepositoryProtocol) {
        self.repo = repo
        super.init()
    }

    func loadTeam() -> Team? {
        return repo.loadTeam()
    }
    
    func save(team:Team) {
        repo.save(team: team)
    }
}

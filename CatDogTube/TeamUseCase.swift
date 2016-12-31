//
//  TeamUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

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
        if (shouldSave(newTeam: team)) {
            repo.save(team: team)
            notifyTeamSaved(team: team)
        }
    }
    
    private func shouldSave(newTeam:Team) -> Bool {
        guard let oldTeam = loadTeam() else {
            return true
        }
        return (oldTeam.contentType != newTeam.contentType)
    }

    private func notifyTeamSaved(team:Team) {
        NotificationCenter.default.post(
            name: Notifications.NAME_TEAM_SAVED,
            object: self, userInfo: [Notifications.KEY_TEAM: team])
    }

}

//
//  TeamUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol TeamRepositoryProtocol {
    func loadTeam() -> Team?
    func save(team:Team)
}

public class TeamUseCase: NSObject {
    
    private let repo: TeamRepositoryProtocol
    
    public init(repo:TeamRepositoryProtocol) {
        self.repo = repo
        super.init()
    }
    
    public func loadTeam() -> Team? {
        return repo.loadTeam()
    }
    
    public func save(team:Team) {
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
        /*
        NotificationCenter.default.post(
            name: Notifications.NAME_TEAM_SAVED,
            object: self, userInfo: [Notifications.KEY_TEAM: team])
 */
    }
    
}

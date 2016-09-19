//
//  TeamRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol TeamDataSourceProtocol {
    func loadTeam() -> Int16
    func save(team:Int16)
}


class TeamRepository: NSObject, TeamRepositoryProtocol {

    private let dataSource : TeamDataSourceProtocol
    
    init(dataSource:TeamDataSourceProtocol) {
        self.dataSource = dataSource
        super.init()
    }
    
    // MARK: - TeamRepositoryProtocol
    func loadTeam() -> ContentType? {
        let teamId:Int16 = dataSource.loadTeam()
        return ContentType(rawValue: teamId)
    }
    
    func save(team contentType:ContentType) {
        dataSource.save(team: contentType.rawValue)
    }
}

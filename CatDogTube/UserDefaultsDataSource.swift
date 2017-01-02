//
//  UserDefaultsDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

class UserDefaultsDataSource: NSObject, TeamDataSourceProtocol {

    private let TEAM_KEY = "team"
    
    // MARK: - TeamDataSourceProtocol
    func loadTeamName() -> String? {
        let ud = UserDefaults.standard
        return ud.string(forKey: TEAM_KEY)
    }
    
    func save(teamName:String) {
        let ud = UserDefaults.standard
        ud.set(teamName, forKey: TEAM_KEY)
        ud.synchronize()
    }

}

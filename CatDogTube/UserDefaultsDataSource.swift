//
//  UserDefaultsDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

class UserDefaultsDataSource: NSObject, TeamDataSourceProtocol {

    private let TEAM_KEY = "team"
    
    // MARK: - TeamDataSourceProtocol
    func loadTeam() -> Int16 {
        let ud = UserDefaults.standard
        return Int16(ud.integer(forKey: TEAM_KEY))
    }
    
    func save(team:Int16) {
        let ud = UserDefaults.standard
        let intVal: Int = Int(team)
        ud.set(intVal, forKey: TEAM_KEY)
        ud.synchronize()
    }

}

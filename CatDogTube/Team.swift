//
//  Team.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

enum TeamName: String {
    case catTeam = "cat_team"
    case dogTeam = "dog_team"
}

class Team: NSObject {

    private let name: TeamName
    
    init(teamName:TeamName) {
        name = teamName
        super.init()
    }
    
    convenience init?(name:String?) {
        guard let teamName = name else {return nil}
        
        if (teamName == TeamName.catTeam.rawValue) {
            self.init(teamName: .catTeam)
        } else if (teamName == TeamName.dogTeam.rawValue) {
            self.init(teamName: .dogTeam)
        } else {
            return nil
        }
    }
    
    func nameString() -> String {
        return name.rawValue
    }
    
    func isDogTeam() -> Bool {
        return name == .dogTeam
    }
}

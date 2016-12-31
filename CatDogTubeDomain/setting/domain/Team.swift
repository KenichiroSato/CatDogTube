//
//  Team.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

enum TeamName: String {
    case catTeam = "cat_team"
    case dogTeam = "dog_team"
    
    static func get(from contentType:ContentType) -> TeamName {
        switch contentType {
        case .cat:
            return .catTeam
        case .dog:
            return .dogTeam
        }
    }
}

public class Team: NSObject {
    
    private let name: TeamName
    
    public let contentType: ContentType
    
    public init(contentType: ContentType) {
        self.contentType = contentType
        name = TeamName.get(from: contentType)
        super.init()
    }
    
    public convenience init?(name:String?) {
        guard let teamName = name else {return nil}
        
        if (teamName == TeamName.catTeam.rawValue) {
            self.init(contentType:.cat)
        } else if (teamName == TeamName.dogTeam.rawValue) {
            self.init(contentType:.dog)
        } else {
            return nil
        }
    }
    
    public func nameString() -> String {
        return name.rawValue
    }
    
    public func isDogTeam() -> Bool {
        return name == .dogTeam
    }
}

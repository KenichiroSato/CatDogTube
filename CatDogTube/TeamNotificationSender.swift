//
//  TeamNotificationSender.swift
//  CatDogTube
//
//  Created by ken on 2017/01/04.
//  Copyright © 2017 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

class TeamNotificationSender: TeamNotificationContract_Sender {
    
    func postSelected(team: Team) {
        NotificationCenter.default.post(
            name: Notifications.NAME_TEAM_SAVED,
            object: self, userInfo: [Notifications.KEY_TEAM: team])
    }
    
}

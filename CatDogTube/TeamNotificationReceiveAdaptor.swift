//
//  TeamNotificationReceiver.swift
//  CatDogTube
//
//  Created by ken on 2017/01/04.
//  Copyright © 2017 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

class TeamNotificationReceiveAdaptor: TeamNotificationContract_ReceiveAdopter {
    
    private let receiver: TeamNotificationContract_Receiver
    
    init(receiver: TeamNotificationContract_Receiver ) {
        self.receiver = receiver
        registerNotificationObserver()
    }
    
    private func registerNotificationObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(notify(notification:)),
            name:Notifications.NAME_TEAM_SAVED , object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self, name: Notifications.NAME_TEAM_SAVED, object: nil)
    }

    @objc private func notify(notification: NSNotification) {
        guard let team = notification.userInfo?[Notifications.KEY_TEAM] as? Team else {
            return
        }
        receiver.onSelected(team: team)
    }
    
    
}

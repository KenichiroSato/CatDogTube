//
//  TeamNotificationContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2017/01/02.
//  Copyright © 2017 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol TeamNotificationContract_Sender {
    func postSelected(team: Team)
}

public protocol TeamNotificationContract_Receiver {
    func onSelected(team: Team)
}

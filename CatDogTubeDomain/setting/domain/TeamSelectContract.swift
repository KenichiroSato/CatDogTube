//
//  TeamSelectContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/12/31.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol TeamSelectContract_View {

    func showDialog()
    
    func dismissDialog()
}

public protocol TeamSelectContract_Presenter {
    
    func set(view: TeamSelectContract_View)
    
    func startTeamSelection()
    
    func onTeamSelected(_ team:Team)
}

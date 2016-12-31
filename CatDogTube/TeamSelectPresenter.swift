//
//  TeamSelectPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import CatDogTubeDomain

class TeamSelectPresenter: NSObject, TeamSelectContract_Presenter {

    private var view: TeamSelectContract_View?
    
    func set(view: TeamSelectContract_View) {
        self.view = view
    }
    
    func startTeamSelection() {
        view?.showDialog()
    }
    
    
    // MARK: - TeamSelectDelegate
    func onTeamSelected(_ team:Team) {
        TeamUseCase.create().save(team: team)
        view?.dismissDialog()
    }

}

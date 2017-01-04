//
//  TeamSelectPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public class TeamSelectPresenter: TeamSelectContract_Presenter {
    
    private var view: TeamSelectContract_View?
    
    private let useCase: TeamUseCase
    
    public init(useCase: TeamUseCase) {
        self.useCase = useCase
    }
    
    public func set(view: TeamSelectContract_View) {
        self.view = view
    }
    
    public func startTeamSelection() {
        view?.showDialog()
    }
    
    // MARK: - TeamSelectDelegate
    public func onTeamSelected(_ team:Team) {
        useCase.save(team: team)
        view?.dismissDialog()
    }
    
}

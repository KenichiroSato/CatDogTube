//
//  TeamSelectPresenter.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import PopupDialog

protocol  TeamSelectDelegate {
    func onTeamSelected(team:Team)
}

class TeamSelectPresenter: NSObject, TeamSelectDelegate {

    private var dialog: PopupDialog
    
    override init() {
        
        // Create a custom view controller
        let teamSelectVC = TeamSelectViewController(nibName:
            TeamSelectViewController.name, bundle: nil)
        
        // Create the dialog
        dialog = PopupDialog(viewController: teamSelectVC,
                             buttonAlignment: .horizontal,
                             transitionStyle: .bounceUp,
                             gestureDismissal: true)

        super.init()
        teamSelectVC.set(teamSelectDelegate: self)
    }
    
    func showDialogWith(parent: UIViewController) {
        parent.present(dialog, animated: true, completion: nil)
    }
    
    
    // MARK: - TeamSelectDelegate
    func onTeamSelected(team:Team) {
        TeamUseCase.create().save(team: team)
        dialog.dismiss()
    }

}

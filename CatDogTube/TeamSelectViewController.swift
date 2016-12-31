//
//  TeamSelectViewController.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import PopupDialog
import CatDogTubeDomain

class TeamSelectViewController: UIViewController, TeamSelectContract_View {

    static let name = "TeamSelectViewController"
    
    private var dialog: PopupDialog?
    
    private var parentVC: UIViewController?
    
    private let presenter: TeamSelectContract_Presenter
    
    init(parent: UIViewController, presenter: TeamSelectContract_Presenter) {
        self.parentVC = parent
        self.presenter = presenter
        super.init(nibName: TeamSelectViewController.name, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func onCatSelected(_ sender: AnyObject) {
        presenter.onTeamSelected(Team(contentType:.cat))
    }

    @IBAction func onDogSelected(_ sender: AnyObject) {
        presenter.onTeamSelected(Team(contentType:.dog))
    }
    
    //MARK: TeamSelectContract_View
    func showDialog() {
        dialog = PopupDialog(viewController: self,
                             buttonAlignment: .horizontal,
                             transitionStyle: .bounceUp,
                             gestureDismissal: true)
        if let dialogVC = dialog {
            parentVC?.present(dialogVC, animated: true, completion: nil)
        }
    }
    
    func dismissDialog() {
        dialog?.dismiss()
    }

}

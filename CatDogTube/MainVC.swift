//
//  MainVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/21.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import PopupDialog
import CatDogTubeDomain

class MainVC: UIViewController {

    private lazy var __once: () = {
            self.setupViews()
        }()

    static let ID = "MainVC"

    @IBOutlet weak var playerView: UIView!
    
    // contains segmentContainerView and buttons
    @IBOutlet weak var contentsView: UIView!
    
    // contains SegmentedVC
    @IBOutlet weak var segmentContainerView: UIView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _ = self.__once
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews() {
        let playerVC = UIStoryboard.instantiateVcWithId(PlayerVC.ID) as! PlayerVC
        playerVC.view.frame = playerView.bounds
        playerView.addSubview(playerVC.view)
        self.addChildViewController(playerVC)
        playerVC.didMove(toParentViewController: self)
        let playerPresenter = PlayVideoPresenter(view: playerVC)
        
        let segmentedVC = UIStoryboard.instantiateVcWithId(SegmentedVC.ID) as! SegmentedVC
        segmentedVC.view.frame = segmentContainerView.bounds
        let presenter = SegmentsPresenter(view: segmentedVC as SegmentedContract_View,
                                          playerPresenter: playerPresenter,
                                          segmentFactory: SegmentFactory())
        segmentedVC.set(presenter: presenter)
        segmentContainerView.addSubview(segmentedVC.view)
        self.addChildViewController(segmentedVC)
        segmentedVC.didMove(toParentViewController: self)
        
        let teamNotificationReceiveAdaptor = TeamNotificationReceiveAdaptor(receiver: presenter)
        presenter.set(adopter: teamNotificationReceiveAdaptor)
    }
    
    @IBAction func onSettingSelected(_ sender: AnyObject) {
        showTeamSelectDialog()
    }
    
    private func showTeamSelectDialog() {
        let repo = TeamRepository(dataSource: UserDefaultsDataSource())
        let useCase = TeamUseCase(repo: repo, sender: TeamNotificationSender())
        let presenter = TeamSelectPresenter(useCase: useCase)
        let teamSelectVC = TeamSelectViewController(parent: self, presenter: presenter)
        presenter.set(view: teamSelectVC)
        presenter.startTeamSelection()
    }
    
    //handle screen rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        contentsView.isHidden = shouldHideContentsView(size)
        super.viewWillTransition(to: size, with:coordinator)
    }
    
    private func shouldHideContentsView(_ newSize: CGSize) -> Bool {
        if (UIDevice.isPad()) {
            return false
        }
        if (newSize.height < newSize.width) {
            return true
        } else {
            return false
        }
    }
    
}

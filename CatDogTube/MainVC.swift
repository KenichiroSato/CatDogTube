//
//  MainVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/21.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    private lazy var __once: () = {
            self.setupViews()
        }()

    static let ID = "MainVC"

    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var contentsView: UIView!
    
    fileprivate var token: Int = 0
    
    fileprivate let playVideoPresenter = PlayVideoPresenter()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _ = self.__once
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupViews() {
        let playerVC = UIStoryboard.instantiateVcWithId(PlayerVC.ID) as! PlayerVC
        playerVC.view.frame = playerView.bounds
        playerView.addSubview(playerVC.view)
        self.addChildViewController(playerVC)
        playerVC.didMove(toParentViewController: self)
        playVideoPresenter.playVideoDelegate = playerVC
        
        let segmentedVC = UIStoryboard.instantiateVcWithId(SegmentedVC.ID) as! SegmentedVC
        segmentedVC.view.frame = contentsView.bounds
        segmentedVC.setPlayVideoPresenter(playVideoPresenter)
        contentsView.addSubview(segmentedVC.view)
        self.addChildViewController(segmentedVC)
        segmentedVC.didMove(toParentViewController: self)
    }
    
    
    //handle screen rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        contentsView.isHidden = shouldHideContentsView(size)
        super.viewWillTransition(to: size, with:coordinator)
    }
    
    fileprivate func shouldHideContentsView(_ newSize: CGSize) -> Bool {
        if (UIDevice.isPad()) {
            return false
        }
        if (newSize.height < newSize.width) {
            return true
        } else {
            return false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

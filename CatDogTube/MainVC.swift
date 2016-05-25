//
//  MainVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/21.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    static let ID = "MainVC"

    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var contentsView: UIView!
    
    private var token: dispatch_once_t = 0
    
    private let playVideoPresenter = PlayVideoPresenter()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dispatch_once(&token) {
            self.setupViews()
        }
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
        playerVC.didMoveToParentViewController(self)
        playVideoPresenter.playVideoDelegate = playerVC
        
        let segmentedVC = UIStoryboard.instantiateVcWithId(SegmentedVC.ID) as! SegmentedVC
        segmentedVC.view.frame = contentsView.bounds
        segmentedVC.setPlayVideoPresenter(playVideoPresenter)
        contentsView.addSubview(segmentedVC.view)
        self.addChildViewController(segmentedVC)
        segmentedVC.didMoveToParentViewController(self)
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

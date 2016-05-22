//
//  MainVC.swift
//  CatDogTube
//
//  Created by 佐藤健一朗 on 2016/05/21.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    static let ID = "MainVC"

    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var contentsView: UIView!
    
    private var token: dispatch_once_t = 0
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
        self.addChildViewController(playerVC)
        playerVC.didMoveToParentViewController(self)
        //playerVC.view.frame = playerView.frame
        playerView.addSubview(playerVC.view)
        
        let segmentedVC = UIStoryboard.instantiateVcWithId(SegmentedVC.ID) as! SegmentedVC
        self.addChildViewController(segmentedVC)
        segmentedVC.didMoveToParentViewController(self)
        //segmentedVC.view.frame = contentsView.frame
        contentsView.addSubview(segmentedVC.view)

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

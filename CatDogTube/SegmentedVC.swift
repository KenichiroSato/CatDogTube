//
//  SegmentViewController.swift
//  Photofully
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import UIKit
import HMSegmentedControl

class SegmentedVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    
    private let segmentedControl = HMSegmentedControl()
    
    var token: dispatch_once_t = 0
    
    override func viewDidAppear(animated: Bool) {
        dispatch_once(&token) {
            self.setupViews()
        }
        let client = YouTubeClient()
        client.getVideos("cute kitten", completionHandler: { videos in
            guard let nonNilVideos = videos where !nonNilVideos.isEmpty else {
                print("error")
                return
            }
            nonNilVideos.forEach({print($0.description)})
        })
    }
    
    private func setupViews() {
        setupSubViews()
        
//        segmentedControl.sectionImages = segments.map{$0.iconImage()}
        segmentedControl.sectionTitles = ["Cats", "Dogs"]
        segmentedControl.type = HMSegmentedControlTypeText
        segmentedControl.backgroundColor = UIColor.greenColor()
        segmentedControl.frame = CGRectMake(0, 0, contentWidth(), self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        segmentedControl.selectionIndicatorColor = UIColor.orangeColor()
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        segmentedControl.indexChangeBlock = {
            [unowned self] (index: Int) in
            let move = self.contentWidth() * CGFloat(index);
            self.contentView.scrollRectToVisible(CGRectMake(move , 0, self.contentWidth(), self.contentHeight()), animated: true)
        }
        headerView.addSubview(segmentedControl)
        
        contentView.delegate = self
        contentView.contentSize =
            CGSizeMake(contentWidth() * CGFloat(2), contentHeight())
        contentView.delaysContentTouches = false
        
    }
    
    private func setupSubViews() {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.blueColor()
        self.addChildViewController(vc1)
        vc1.didMoveToParentViewController(self)
        vc1.view.frame = CGRectMake(0, 0, contentWidth(), contentHeight())
        if let view = vc1.view {
            contentView.addSubview(view)
        }
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.redColor()
        self.addChildViewController(vc2)
        vc2.didMoveToParentViewController(self)
        vc2.view.frame = CGRectMake(contentWidth(), 0, contentWidth(), contentHeight())
        if let view = vc2.view {
            contentView.addSubview(view)
        }
    }
    
    private func contentWidth() -> CGFloat {
        return contentView.frame.size.width
    }
    
    private func contentHeight() -> CGFloat {
        return contentView.frame.size.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = self.view.frame.size.width
        let page = contentView.contentOffset.x / pageWidth
        segmentedControl.setSelectedSegmentIndex(UInt(page), animated: true)
    }
    
}

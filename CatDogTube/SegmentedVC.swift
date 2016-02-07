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
    
    private let searchWords = ["cute kiten", "cute puppy", "かわいい 子猫", "かわいい　子犬"]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    
    private let segmentedControl = HMSegmentedControl()
    
    var token: dispatch_once_t = 0
    
    override func viewDidAppear(animated: Bool) {
        dispatch_once(&token) {
            self.setupViews()
        }
    }
    
    private func setupViews() {
        setupSubViews()
        
//        segmentedControl.sectionImages = segments.map{$0.iconImage()}
        segmentedControl.sectionTitles = ["Cats", "Dogs", "子猫", "子犬"]
        segmentedControl.type = HMSegmentedControlTypeText
        segmentedControl.backgroundColor = UIColor.redColor()
        segmentedControl.frame = CGRectMake(0, 0, contentWidth(), self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        segmentedControl.selectionIndicatorColor = UIColor.orangeColor()
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        segmentedControl.indexChangeBlock = {
            [unowned self] (index: Int) in
            let move = self.contentWidth() * CGFloat(index);
            self.contentView.scrollRectToVisible(
                CGRectMake(move , 0, self.contentWidth(), self.contentHeight()), animated: true)
        }
        headerView.addSubview(segmentedControl)
        
        contentView.delegate = self
        contentView.contentSize =
            CGSizeMake(contentWidth() * CGFloat(searchWords.count), contentHeight())
        contentView.delaysContentTouches = false
        
    }
    
    private func setupSubViews() {
        for (index, word) in searchWords.enumerate() {
            guard let vc = self.storyboard?.instantiateViewControllerWithIdentifier(
                VideoCollectionVC.IDENTIFIER) as? VideoCollectionVC else {return}
            
            vc.searchWord = word
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = CGRectMake(CGFloat(index) * contentWidth(), 0, contentWidth(), contentHeight())
            if let view = vc.view {
                contentView.addSubview(view)
            }
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

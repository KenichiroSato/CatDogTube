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
    
    private let searchWords = ["cute kitten", "cute puppy", "かわいい 子猫", "かわいい　子犬"]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    
    private let segmentedControl = HMSegmentedControl()
    
    var token: dispatch_once_t = 0
    
    override func viewDidAppear(animated: Bool) {
        dispatch_once(&token) {
            self.setupViews()
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator:coordinator)
        updateFrames(size)
    }
    
    private func updateFrames(newSize: CGSize) {
        let index = contentView.currentIndex()
        contentView.frame = CGRectMake(0, 0, newSize.width,
            newSize.height - self.headerView.frame.size.height)
        contentView.contentSize =
            CGSizeMake(contentView.width() * CGFloat(searchWords.count), contentView.height())
        segmentedControl.frame = CGRectMake(0, 0, contentView.width(),
            self.headerView.frame.size.height)
        for (index,view) in contentView.subviews.enumerate() {
            view.frame = CGRectMake(CGFloat(index) * contentView.width(), 0, contentView.width(), contentView.height())
        }
        contentView.moveToIndex(index)
    }
    
    private func setupViews() {
        setupSubViews()
        
//        segmentedControl.sectionImages = segments.map{$0.iconImage()}
        segmentedControl.sectionTitles = ["Cats", "Dogs", "子猫", "子犬"]
        segmentedControl.type = HMSegmentedControlTypeText
        segmentedControl.backgroundColor = UIColor.redColor()
        segmentedControl.frame = CGRectMake(0, 0, contentView.width(),
            self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        segmentedControl.selectionIndicatorColor = UIColor.orangeColor()
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        segmentedControl.indexChangeBlock = {
            [unowned self] (index: Int) in
            self.contentView.moveToIndex(index)
        }
        headerView.addSubview(segmentedControl)
        
        contentView.delegate = self
        contentView.contentSize =
            CGSizeMake(contentView.width() * CGFloat(searchWords.count), contentView.height())
        contentView.delaysContentTouches = false
        
    }
    
    private func setupSubViews() {
        for (index, word) in searchWords.enumerate() {
            guard let vc = self.storyboard?.instantiateViewControllerWithIdentifier(
                VideoCollectionVC.IDENTIFIER) as? VideoCollectionVC else {return}
            
            vc.searchWord = word
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = CGRectMake(CGFloat(index) * contentView.width(), 0,
                contentView.width(), contentView.height())
            if let view = vc.view {
                contentView.addSubview(view)
            }
        }
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

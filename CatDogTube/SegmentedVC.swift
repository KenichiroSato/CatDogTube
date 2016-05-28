//
//  SegmentViewController.swift
//  Photofully
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import UIKit
import HMSegmentedControl

protocol SegmentdChildViewDelegate {
    func onSegmentChanged(isCurrentIndex:Bool)
}

class SegmentedVC: UIViewController, UIScrollViewDelegate {
    
    static let ID = "SegmentedVC"

    private var gradientColors : [CGColor] {
        get {
            let darkColor = UIColor.blackColor().colorWithAlphaComponent(0.4).CGColor
            let middleColor = UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor
            let clearColor = UIColor.clearColor().CGColor
            return [darkColor, middleColor, clearColor]
        }
    }

    // add Segment Item in Factory to increase Tab items
    private let segmentedItems = SegmentFactory.generate()
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    @IBOutlet weak var shadowView: UIView!
    private let shadowLayer = CAGradientLayer()
    
    private let segmentedControl = HMSegmentedControl()
    
    var token: dispatch_once_t = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.scrollsToTop = false
    }
    
    override func viewDidAppear(animated: Bool) {
        dispatch_once(&token) {
            self.setupViews()
        }
    }
    
    private func setupViews() {
        setupSubViews()
        setupShadowView()
        
        segmentedControl.sectionImages = segmentedItems.map({$0.iconImage})
        segmentedControl.type = HMSegmentedControlTypeImages
        segmentedControl.backgroundColor = UIColor.redColor()
        segmentedControl.frame = CGRectMake(0, 0, contentView.width(),
            self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        segmentedControl.selectionIndicatorColor = UIColor.whiteColor()
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        segmentedControl.indexChangeBlock = {
            [unowned self] (index: Int) in
            self.contentView.moveToIndex(index)
        }
        headerView.addSubview(segmentedControl)
        
        contentView.delegate = self
        contentView.contentSize =
            CGSizeMake(contentView.width() * CGFloat(segmentedItems.count), contentView.height())
        contentView.delaysContentTouches = false
        notifySegmentChanged()
    }
    
    private func setupShadowView() {
        shadowLayer.colors = gradientColors
        shadowLayer.frame = shadowView.bounds
        shadowView.layer.insertSublayer(shadowLayer, atIndex: 0)
    }

    private func setupSubViews() {
        for (index, item) in segmentedItems.enumerate() {
            
            let vc = item.viewController
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            vc.view.frame = CGRectMake(CGFloat(index) * contentView.width(), 0,
                contentView.width(), contentView.height())
            if let view = vc.view {
                contentView.addSubview(view)
            }
        }
    }
    
    private func notifySegmentChanged() {
        for (index, childVC) in self.childViewControllers.enumerate() {
            if let vc = childVC as? SegmentdChildViewDelegate {
                let isCurrentIndex = (index == self.contentView.currentIndex())
                vc.onSegmentChanged(isCurrentIndex)
            }
        }
    }
    
    func setPlayVideoPresenter(presenter: PlayVideoPresenter) {
        segmentedItems.forEach({
            if let vc = $0.viewController as? VideoCollectionVC {
                vc.playVideoPresenter = presenter
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This is called after user manually scrolled
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = self.view.frame.size.width
        let page = contentView.contentOffset.x / pageWidth
        segmentedControl.setSelectedSegmentIndex(UInt(page), animated: true)
        notifySegmentChanged()
    }
    
    //This is called after user tapped Tab area
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        notifySegmentChanged()
    }
    
}

//
//  SegmentViewController.swift
//  Photofully
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright (c) 2015 Kenichiro Sato. All rights reserved.
//

import HMSegmentedControl

class SegmentedVC: UIViewController, UIScrollViewDelegate, SegmentedContract_View {
    
    private lazy var __once: () = {
            self.presenter?.loadSegments()
            self.registerNotificationObserver()
        }()
    
    static let ID = "SegmentedVC"

    private var gradientColors : [CGColor] {
        get {
            let darkColor = UIColor.black.withAlphaComponent(0.4).cgColor
            let middleColor = UIColor.black.withAlphaComponent(0.1).cgColor
            let clearColor = UIColor.clear.cgColor
            return [darkColor, middleColor, clearColor]
        }
    }
    
    var presenter: SegmentedContract_Presenter?

    // add Segment Item in Factory to increase Tab items
    private var segmentedItems: [Segment] = []
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    @IBOutlet weak var shadowView: UIView!
    private let shadowLayer = CAGradientLayer()
    
    private let segmentedControl = HMSegmentedControl()
    
    private func registerNotificationObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(reorderTabs(notification:)),
            name:Notifications.NAME_TEAM_SAVED , object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self, name: Notifications.NAME_TEAM_SAVED, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _ = self.__once
    }
    
    func show(segments: [Segment]) {
        self.segmentedItems = segments
        setupViews()
    }

    private func setupViews() {
        setupSubViews()
        setupShadowView()
        
        segmentedControl.sectionImages = segmentedItems.map({$0.iconImage})
        segmentedControl.type = HMSegmentedControlTypeImages
        segmentedControl.backgroundColor = UIColor.red
        segmentedControl.frame = CGRect(x: 0, y: 0, width: contentView.width(),
            height: self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        segmentedControl.selectionIndicatorColor = UIColor.white
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        segmentedControl.indexChangeBlock = {
            [unowned self] (index: Int) in
            self.contentView.move(to:index)
        }
        headerView.addSubview(segmentedControl)
        
        contentView.delegate = self
        contentView.contentSize =
            CGSize(width: contentView.width() * CGFloat(segmentedItems.count), height: contentView.height())
        contentView.delaysContentTouches = false
    }
    
    private func setupShadowView() {
        shadowLayer.colors = gradientColors
        shadowLayer.frame = shadowView.bounds
        shadowView.layer.insertSublayer(shadowLayer, at: 0)
    }

    private func setupSubViews() {
        for (index, item) in segmentedItems.enumerated() {
            guard let vc = item.viewController as? UIViewController else {
                continue
            }
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = CGRect(x: CGFloat(index) * contentView.width(), y: 0,
                width: contentView.width(), height: contentView.height())
            if let view = vc.view {
                contentView.addSubview(view)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This is called after user manually scrolled
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = self.view.frame.size.width
        let page = contentView.contentOffset.x / pageWidth
        segmentedControl.setSelectedSegmentIndex(UInt(page), animated: true)
    }
    
    //This is called after user tapped Tab area
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //nop
    }
    
    @objc private func reorderTabs(notification: NSNotification) {
        
        guard let team = notification.userInfo?[Notifications.KEY_TEAM] as? Team else {
            return
        }
        guard let firstSegment = segmentedItems.first,
            team.contentType != firstSegment.contentType else {
            return
        }
        
        segmentedItems.reverse()
        contentView.removeAllSubViews()
        setupSubViews()
        segmentedControl.sectionImages = segmentedItems.map({$0.iconImage})
        let newIndex = oppositeIndex(from: segmentedControl.selectedSegmentIndex)
        segmentedControl.setSelectedSegmentIndex(UInt(newIndex), animated: true)
        contentView.move(to: newIndex)
    }
    
    private func oppositeIndex(from currentIndex:Int) -> Int {
        let opposite = (currentIndex == 0) ? 1 : 0
        return opposite
    }
}

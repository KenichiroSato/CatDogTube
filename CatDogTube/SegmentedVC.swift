//
//  SegmentViewController.swift
//  Photofully
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright (c) 2015 Kenichiro Sato. All rights reserved.
//

import HMSegmentedControl
import CatDogTubeDomain

class SegmentedVC: UIViewController, UIScrollViewDelegate, SegmentedContract_View {
    
    private let ICON_SIZE : CGFloat = 45.0
    
    private lazy var __once: () = {
        self.presenter?.loadSegments()
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
    
    private var presenter: SegmentedContract_Presenter?
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIScrollView!
    @IBOutlet weak var shadowView: UIView!
    private let shadowLayer = CAGradientLayer()
    
    private let segmentedControl = HMSegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _ = self.__once
    }
    
    func set(presenter: SegmentedContract_Presenter) {
        self.presenter = presenter
    }
    
    func show(segments: [SegmentProtocol]) {
        setupViews(with: segments)
    }

    private func setupViews(with segmentedItems:[SegmentProtocol]) {
        setupSubViews(with: segmentedItems)
        setupShadowView()
        
        segmentedControl.sectionImages = segmentedItems.map({self.iconImage($0.iconName())})
        segmentedControl.type = HMSegmentedControlType.images
        segmentedControl.backgroundColor = UIColor.red
        segmentedControl.frame = CGRect(x: 0, y: 0, width: contentView.width(),
            height: self.headerView.frame.size.height)
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        segmentedControl.selectionIndicatorColor = UIColor.white
        segmentedControl.titleTextAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor) : UIColor.white];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
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

    private func setupSubViews(with segmentedItems:[SegmentProtocol]) {
        for (index, item) in segmentedItems.enumerated() {
            guard let vc = item.view() as? UIViewController else {
                continue
            }
            self.addChild(vc)
            vc.didMove(toParent: self)
            vc.view.frame = CGRect(x: CGFloat(index) * contentView.width(), y: 0,
                width: contentView.width(), height: contentView.height())
            if let view = vc.view {
                contentView.addSubview(view)
            }
        }
    }
    
    private func iconImage(_ iconName: String) -> UIImage {
        return UIImage.named(iconName, size: CGSize(width: ICON_SIZE, height: ICON_SIZE))!
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
    
    func reorder(segments: [SegmentProtocol]) {
        contentView.removeAllSubViews()
        setupSubViews(with: segments)
        segmentedControl.sectionImages = segments.map({self.iconImage($0.iconName())})
        let newIndex = oppositeIndex(from: segmentedControl.selectedSegmentIndex)
        segmentedControl.setSelectedSegmentIndex(UInt(newIndex), animated: true)
        contentView.move(to: newIndex)
    }
    
    private func oppositeIndex(from currentIndex:Int) -> Int {
        let opposite = (currentIndex == 0) ? 1 : 0
        return opposite
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

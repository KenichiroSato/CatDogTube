//
//  VideoCollectionVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class VideoCollectionVC: UIViewController, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout, LoadVideoDelegate, SegmentdChildViewDelegate {
    
    static let IDENTIFIER = "VideoCollectionVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource: VideoCollectionDataSource
    
    var presenter: LoadVideoPresenter?
    
    private var refreshControl = UIRefreshControl()
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = VideoCollectionDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self

        refreshControl.addTarget(self, action: #selector(VideoCollectionVC.pullToRefresh),
            forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.tintColor = UIColor.blackColor()
        collectionView.addSubview(refreshControl)

        presenter?.loadVideoDelegate = self
        presenter?.loadVideo()
    }
    
    func invalidateLayout() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func pullToRefresh() {
        presenter?.loadVideo()
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == SegueIdentifier.SHOW_PLAYER) {
            if let selectedIndexPath = self.collectionView?.indexPathsForSelectedItems(),
                let nextVC = segue.destinationViewController as? PlayerVC {
                    let index = selectedIndexPath[0].item
                    nextVC.video = dataSource.video(index)
            }
        }
    }
    
    // MARK - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let width = self.view.frame.width
            let height = width * VideoCell.aspectRatio
            return CGSizeMake(width, height)
    }

    // MARK: LoadVideoDelegate
    func onLoadSuccess(videos: [Video]) {
        dataSource.videos = videos
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
    }
    
    func onLoadFail() {
        print("onFail")
    }

    // MARK: SegmentdChildViewDelegate
    func onSegmentChanged(isCurrentIndex: Bool) {
        collectionView.scrollsToTop = isCurrentIndex
    }
}

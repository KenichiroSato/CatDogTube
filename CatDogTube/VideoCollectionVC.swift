//
//  VideoCollectionVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class VideoCollectionVC: UIViewController, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout, LoadVideoDelegate,
    SegmentdChildViewDelegate, TryReloadDelegate {
    
    static let ID = "VideoCollectionVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tryReloadView: TryReloadView!
    
    let dataSource: VideoCollectionDataSource
    
    var presenter: LoadVideoPresenter?
    
    var videoListStatusDelegate: VideoListStatusDelegate?
    
    private var refreshControl = UIRefreshControl()
    
    private var isForeground = false

    required init?(coder aDecoder: NSCoder) {
        dataSource = VideoCollectionDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self

        refreshControl.addTarget(self, action: #selector(VideoCollectionVC.pullToRefresh),
            for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.black
        collectionView.addSubview(refreshControl)

        tryReloadView.reloadDelegate = self
        
        presenter?.loadVideoDelegate = self
        loadVideo(true)
    }
    
    func invalidateLayout() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func loadVideo(_ showFullScreenLoading:Bool) {
        if (showFullScreenLoading) {
            tryReloadView.showIndicator()
        }
        presenter?.loadVideo()
    }

    func pullToRefresh() {
        loadVideo(false)
    }
    
    private func showErrorDialog() {
        let alertController = UIAlertController(title: Text.MSG_FAILED_TO_LOAD,
                                                message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Text.OK, style: .default, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = self.view.frame.width
            let height = width * VideoCell.aspectRatio
            return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let video = dataSource.video((indexPath as NSIndexPath).row) {
            videoListStatusDelegate?.onItemTapped(video)
        }
    }
    
    // MARK: LoadVideoDelegate
    func onLoadSuccess(_ videos: [Video]) {
        dataSource.videos = videos
        videoListStatusDelegate?.onListLoadFinished(videos, isForeground: isForeground)
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
        tryReloadView.hide()
    }
    
    func onLoadFail() {
        dataSource.videos = []
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
        tryReloadView.showReload()
        showErrorDialog()
    }

    // MARK: TryReloadDelegate
    func onTryReload() {
        loadVideo(true)
    }
    
    // MARK: SegmentdChildViewDelegate
    func onSegmentChanged(_ isCurrentIndex: Bool) {
        collectionView.scrollsToTop = isCurrentIndex
        isForeground = isCurrentIndex
    }
}

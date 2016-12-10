//
//  VideoCollectionVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

class VideoCollectionVC: UIViewController, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout, VideoCollectionContract_View, SegmentdChildViewDelegate, TryReloadDelegate {
    
    static let ID = "VideoCollectionVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tryReloadView: TryReloadView!
    
    let dataSource: VideoCollectionDataSource
    
    var presenter: VideoCollectionContract_Presenter?
    
    var videoListStatusDelegate: PlayerContract_Presenter?
    
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
        
        presenter?.set(view: self)
        loadVideo(withFullScreenIndicator: true)
    }
    
    func invalidateLayout() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func loadVideo(withFullScreenIndicator:Bool) {
        presenter?.loadVideo(withFullScreenIndicator: withFullScreenIndicator)
    }

    func pullToRefresh() {
        loadVideo(withFullScreenIndicator: false)
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
            videoListStatusDelegate?.onVideoTapped(video)
        }
    }
    
    // MARK: VideoCollectionContract_View
    func show(videos:[Video]) {
        dataSource.videos = videos
        videoListStatusDelegate?.onVideoLoaded(videos, isForeground: isForeground)
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
    }
    
    func showLoadingIndicator() {
        tryReloadView.showIndicator()
    }
    
    func showErrorUI() {
        tryReloadView.showReload()
        showErrorDialog()
    }
    
    func hideErrorUI() {
        tryReloadView.hide()
    }
    
    // MARK: TryReloadDelegate
    func onTryReload() {
        loadVideo(withFullScreenIndicator: true)
    }
    
    // MARK: SegmentdChildViewDelegate
    func onSegmentChanged(_ isCurrentIndex: Bool) {
        isForeground = isCurrentIndex
    }
}

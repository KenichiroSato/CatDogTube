//
//  VideoCollectionVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import CatDogTubeDomain

class VideoCollectionVC: UIViewController,
                         UICollectionViewDelegate,
                         UICollectionViewDelegateFlowLayout,
                         VideoCollectionContract_View,
                         TryReloadDelegate {
    
    static let ID = "VideoCollectionVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tryReloadView: TryReloadView!
    
    let dataSource: VideoCollectionDataSource
    
    private var presenter: VideoCollectionContract_Presenter?
    
    private var refreshControl = UIRefreshControl()
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = VideoCollectionDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: VideoViewCell.nibName, bundle: nil),
                                forCellWithReuseIdentifier: VideoViewCell.reuseIdintifier)
        
        refreshControl.addTarget(self, action: #selector(VideoCollectionVC.pullToRefresh),
            for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.black
        collectionView.addSubview(refreshControl)

        tryReloadView.reloadDelegate = self
        
        loadVideo()
    }
    
    func invalidateLayout() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func loadVideo() {
        presenter?.loadVideo()
    }

    @objc func pullToRefresh() {
        presenter?.refreshVideos()
    }
    
    private func showErrorDialog() {
        let alertController = UIAlertController(title: Text.MSG_FAILED_TO_LOAD,
                                                message: nil,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: Text.OK, style: .default, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        let height = width * VideoViewCell.aspectRatio
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if let video = dataSource.video((indexPath as NSIndexPath).row) {
            presenter?.onVideoTapped(video)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        presenter?.onScrolled(visiblePosition: indexPath.item)
    }
    
    // MARK: VideoCollectionContract_View
    public func set(presenter: VideoCollectionContract_Presenter) {
        self.presenter = presenter
    }
    
    func show(videos:[Video]) {
        dataSource.videos = videos
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
        loadVideo()
    }
    
}

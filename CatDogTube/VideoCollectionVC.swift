//
//  VideoCollectionVC.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class VideoCollectionVC: UIViewController, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout, VideoLoadDelegate {
    
    static let IDENTIFIER = "VideoCollectionVC"
    
    private let YOUTUVE_SCHEME = "http://www.youtube.com/watch?v="
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource: VideoCollectionDataSource
    
    var searchWord:String = ""
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = VideoCollectionDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        dataSource.loadDelegate = self
        dataSource.loadVideos(searchWord)
    }
    
    private func openYouTubeApp(videoId:String) -> Bool {
        if let url = NSURL(string: YOUTUVE_SCHEME  + videoId) {
            return UIApplication.sharedApplication().openURL(url)
        } else {
            return false
        }
    }
    
    // MARK - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        guard 0 <= index && index < dataSource.videos.count else {return}
        
        let videoId = dataSource.videos[index].videoId
        openYouTubeApp(videoId)
    }
    
    // MARK - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let width = UIScreen.mainScreen().bounds.width
            return CGSizeMake(width, 300)
    }

    // MARK: PhotosLoadDelegate
    func onLoadSuccess() {
        dispatch_async(dispatch_get_main_queue(), {
            self.collectionView.reloadData()
        })

    }
    
    func onLoadFail() {
        print("onFail")
    }

}

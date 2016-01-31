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
    
    // MARK - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let width = UIScreen.mainScreen().bounds.width
            return CGSizeMake(width, 400)
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

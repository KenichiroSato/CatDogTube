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
    
    func invalidateLayout() {
        collectionView.collectionViewLayout.invalidateLayout()
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
            let height = width * 9 / 16
            return CGSizeMake(width, height)
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

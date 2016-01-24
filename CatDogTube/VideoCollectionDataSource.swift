//
//  VideoCollectionDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SDWebImage

protocol VideoLoadDelegate {
    func onLoadSuccess()
    func onLoadFail()
}

class VideoCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let REUSE_IDENTIFIER = "VideoCell"

    var videos: [Video] = []
  
    var loadDelegate: VideoLoadDelegate?
    
    func loadVideos() {
        let client = YouTubeClient()
        client.getVideos("cute kitten", completionHandler: { videos in
            guard let nonNilVideos = videos where !nonNilVideos.isEmpty else {
                self.loadDelegate?.onLoadFail()
                return
            }
            self.videos = nonNilVideos
            self.loadDelegate?.onLoadSuccess()
            nonNilVideos.forEach({print($0.description)})
        })
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(REUSE_IDENTIFIER, forIndexPath: indexPath)
                as! VideoCell
            
            let video = videos[indexPath.row]
            cell.imageView.sd_setImageWithURL(video.imageUrl, placeholderImage: nil, options: SDWebImageOptions.RetryFailed)
            cell.titleView.text = video.title
            
            return cell
    }
}

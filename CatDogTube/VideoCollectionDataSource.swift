//
//  VideoCollectionDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper

protocol VideoLoadDelegate {
    func onLoadSuccess()
    func onLoadFail()
}

class VideoCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let REUSE_IDENTIFIER = "VideoCell"

    var videos: [Video] = []
  
    var loadDelegate: VideoLoadDelegate?
    
    func loadVideos(searchWord:String) {
        let client = YouTubeClient()
        client.getVideos(searchWord, completionHandler: { videos in
            guard let nonNilVideos = videos where !nonNilVideos.isEmpty else {
                self.loadDelegate?.onLoadFail()
                return
            }
            self.videos = nonNilVideos
            self.loadDelegate?.onLoadSuccess()
        })
    }
    
    func video(index:Int) -> Video? {
        guard 0 <= index && index < videos.count else { return nil }
        return videos[index]
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
            cell.title.text = video.title
            cell.imageView.sd_setImageWithURL(video.imageUrl, placeholderImage: nil, options: SDWebImageOptions.RetryFailed, completed: {_,_, cacheType,_ in
                if (cacheType == .None) { // downloaded from Internet
                    // add GradianeLayer to image and store the image to cache
                    cell.imageView.addGradientLayer()
                    SDImageCache.sharedImageCache()
                        .storeImage(cell.imageView.image, forKey: String(video.imageUrl))
                }
            })
            return cell
    }
}

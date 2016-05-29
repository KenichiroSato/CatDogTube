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

class VideoCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let REUSE_IDENTIFIER = "VideoCell"

    var videos: [Video] = []
  
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
            cell.setTitileWithShadow(video.title)
            cell.imageView.sd_setImageWithURL(video.imageUrl, placeholderImage: nil, options: SDWebImageOptions.RetryFailed, completed: {_,_, cacheType,_ in
                cell.imageView.addGradientLayer(UIColor.whiteColor())
            })
            return cell
    }
}

//
//  VideoCollectionDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper
import CatDogTubeDomain

class VideoCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let REUSE_IDENTIFIER = "VideoCell"

    var videos: [Video] = []
  
    func video(_ index:Int) -> Video? {
        guard 0 <= index && index < videos.count else { return nil }
        return videos[index]
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSE_IDENTIFIER, for: indexPath)
                as! VideoCell
            
            let video = videos[(indexPath as NSIndexPath).row]
            cell.setTitileWithShadow(video.title)
            cell.imageView.sd_setImage(with: video.imageUrl, placeholderImage: nil, options: SDWebImageOptions.retryFailed, completed: {_,_, cacheType,_ in
                cell.imageView.addGradientLayer(UIColor.white)
            })
            return cell
    }
}

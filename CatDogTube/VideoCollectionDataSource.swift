//
//  VideoCollectionDataSource.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import CatDogTubeDomain

class VideoCollectionDataSource: NSObject, UICollectionViewDataSource {

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoViewCell.reuseIdintifier,
                                                      for: indexPath) as! VideoViewCell
        let video = videos[(indexPath as NSIndexPath).row]
        cell.set(title: video.title)
        cell.setThumbnail(with: video.imageUrl)
        return cell
    }
}

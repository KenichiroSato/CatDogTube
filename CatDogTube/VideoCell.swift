//
//  VideoCell.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/24.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    class var aspectRatio : CGFloat {
        get {
            if (UIDevice.currentDevice().orientation.isLandscape) {
                return 9 / 16
            } else {
                return 9 / 16
            }
        }
    }
    
}

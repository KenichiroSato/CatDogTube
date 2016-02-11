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
    
    func setGradientLayer() {
        if (imageView.layer.sublayers?[0] == nil) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clearColor().CGColor,
            UIColor.clearColor().CGColor, UIColor.blackColor().CGColor]
        gradientLayer.frame = imageView.frame
        imageView.layer.insertSublayer(gradientLayer, atIndex: 0)
        }
    }
}

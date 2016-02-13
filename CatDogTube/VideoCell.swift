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
    
    private var gradientColors : [CGColor] {
        get {
            let darkColor = UIColor.blackColor().colorWithAlphaComponent(0.8).CGColor
            let clearColor = UIColor.clearColor().CGColor
            return [clearColor, clearColor, darkColor]
        }
    }

    func setGradientLayer() {
        var gradientLayer : CAGradientLayer
        if let existingLayer = imageView.layer.sublayers?[0] as? CAGradientLayer {
            gradientLayer = existingLayer
        } else {
            gradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors
            imageView.layer.insertSublayer(gradientLayer, atIndex: 0)
        }
        gradientLayer.frame = self.bounds
    }
    
    class var aspectRatio : CGFloat {
        get {
            if (UIDevice.currentDevice().orientation.isPortrait) {
                return 9 / 16
            } else {
                return 6 / 16
            }
        }
    }
    
}

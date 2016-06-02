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
            if (UIDevice.isPad()) {
                return 9 / 16
            } else {
                return 8 / 16
            }
        }
    }
    
    func setTitileWithShadow(title:String) {
        let attrStr = NSMutableAttributedString(string: title)
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor()
        shadow.shadowBlurRadius = 4.0
        shadow.shadowOffset = CGSizeMake(1, 1)
        attrStr.addAttribute(NSShadowAttributeName, value: shadow,
                             range:NSMakeRange(0, attrStr.length))
        self.title.attributedText = attrStr
    }
}

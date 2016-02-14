//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class SegmentedItem : NSObject {

    private let ICON_SIZE : CGFloat = 50.0
    
    let searchWord:String
    
    private let iconName:String
    
    var iconImage:UIImage {
        get {
            return UIImage.named(iconName, size: CGSizeMake(ICON_SIZE, ICON_SIZE))!
        }
    }
    
    init(searchWord:String, iconName:String) {
        self.searchWord = searchWord
        self.iconName = iconName
    }

}
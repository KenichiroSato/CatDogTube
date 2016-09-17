//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class Segment : NSObject {

    private let ICON_SIZE : CGFloat = 45.0
    
    private let iconName:String
    
    var iconImage:UIImage {
        get {
            return UIImage.named(iconName, size: CGSize(width: ICON_SIZE, height: ICON_SIZE))!
        }
    }

    let viewController: UIViewController
    
    init(vc:UIViewController, iconName:String) {
        self.viewController = vc
        self.iconName = iconName
        super.init()
    }

}

//
//  UIView+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/25.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIView {
    
    func removeAllSubViews() {
        self.subviews.forEach({$0.removeFromSuperview()})
    }
}

//
//  UIDevice+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/28.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class func isPad() -> Bool {
        return (self.current.userInterfaceIdiom == .pad)
    }
    
    class func isPhone() -> Bool {
        return (self.current.userInterfaceIdiom == .phone)
    }
    
}

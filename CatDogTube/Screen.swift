//
//  Screen.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2015/11/23.
//  Copyright © 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import UIKit

class Screen {
    
    static func HEIGHT() -> CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    static func WIDTH() -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    static func STATUS_BAR_HEIGHT() -> CGFloat {
        return UIDevice.currentDevice().orientation.isLandscape ? 0 : 20
    }
    
    
}
//
//  UIStoryBoard+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/05/21.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    class func instantiateVcWithId(_ id:String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id)
    }
}

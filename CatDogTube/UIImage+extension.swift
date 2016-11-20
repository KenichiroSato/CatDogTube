//
//  UIImage+extension.swift
//  Photofully
//
//  Created by Kenichiro Sato on 2015/07/20.
//  Copyright (c) 2015 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func named(_ name:String, size:CGSize) -> UIImage? {
        if let image = UIImage(named: name) {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
            
            let ratio: CGFloat = size.width / image.size.width
            image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: ratio * image.size.height))
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
    
}

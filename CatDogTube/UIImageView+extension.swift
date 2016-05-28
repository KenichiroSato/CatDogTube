//
//  UIView+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private var gradientColors : [CGColor] {
        get {
            let whiteColor = UIColor.whiteColor().colorWithAlphaComponent(1.0).CGColor
            let clearColor = UIColor.whiteColor().colorWithAlphaComponent(0.0).CGColor
            return [whiteColor, clearColor, clearColor,clearColor, clearColor,clearColor, clearColor, clearColor, clearColor, whiteColor]
        }
    }
    
    func addGradientLayer() {
        setGradientLayer()
        self.image = self.getImageFromView()
        removeGradientLayer()
    }
    
    private func setGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    private func removeGradientLayer() {
        self.layer.sublayers?[0].removeFromSuperlayer()
    }
    
    private func getImageFromView() -> UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.renderInContext(context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }

}
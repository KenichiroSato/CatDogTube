//
//  UIView+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

enum ViewSide {
    
    static let allValues = [top, bottom, right, left]
    
    case top
    case bottom
    case right
    case left
    
    func gradationFrame(_ view: UIView) -> CGRect {
        switch (self) {
        case .top:
            return CGRect(x: 0, y: 0, width: view.bounds.width, height: UIImageView.GRADIENT_SIZE)
        case .bottom:
            return CGRect(x: 0, y: view.bounds.height - UIImageView.GRADIENT_SIZE ,
                              width: view.bounds.width, height: UIImageView.GRADIENT_SIZE)
        case .right:
            return CGRect(x: view.bounds.width - UIImageView.GRADIENT_SIZE, y: 0, width: UIImageView.GRADIENT_SIZE, height: view.bounds.height)
        case .left:
            return CGRect(x: 0, y: 0, width: UIImageView.GRADIENT_SIZE, height: view.bounds.height)
        }
    }
    
    func points() -> (start: CGPoint, end: CGPoint) {
        switch (self) {
        case .top:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1))
        case .bottom:
            return (CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 0))
        case .left:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0))
        case .right:
            return (CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        }
    }
}

extension UIImageView {
    
    static fileprivate let GRADIENT_SIZE: CGFloat = 15.0
    
    func addGradientLayer(_ baseColor:UIColor) {
        for side in ViewSide.allValues {
            let gradient = CAGradientLayer()
            gradient.colors = gradientColors(baseColor)
            gradient.frame = side.gradationFrame(self)
            gradient.startPoint = side.points().start
            gradient.endPoint = side.points().end
            self.layer.insertSublayer(gradient, at: 0)
        }
        self.image = self.getImageFromView()
        removeGradientLayer()
    }
    
    fileprivate func gradientColors(_ baseColor:UIColor) -> [CGColor] {
        let startColor = baseColor.cgColor
        let clearColor = baseColor.withAlphaComponent(0.0).cgColor
        return [startColor, clearColor]
    }
    
    fileprivate func removeGradientLayer() {
        self.layer.sublayers?.forEach({$0.removeFromSuperlayer()})
    }
    
    fileprivate func getImageFromView() -> UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }

}

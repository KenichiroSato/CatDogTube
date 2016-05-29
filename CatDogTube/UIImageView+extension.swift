//
//  UIView+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

enum ViewSide {
    
    static let allValues = [TOP, BOTTOM, RIGHT, LEFT]
    
    case TOP
    case BOTTOM
    case RIGHT
    case LEFT
    
    func gradationFrame(view: UIView) -> CGRect {
        switch (self) {
        case .TOP:
            return CGRectMake(0, 0, view.bounds.width, UIImageView.GRADIENT_SIZE)
        case .BOTTOM:
            return CGRectMake(0, view.bounds.height - UIImageView.GRADIENT_SIZE ,
                              view.bounds.width, UIImageView.GRADIENT_SIZE)
        case .RIGHT:
            return CGRectMake(view.bounds.width - UIImageView.GRADIENT_SIZE, 0, UIImageView.GRADIENT_SIZE, view.bounds.height)
        case .LEFT:
            return CGRectMake(0, 0, UIImageView.GRADIENT_SIZE, view.bounds.height)
        }
    }
    
    func points() -> (start: CGPoint, end: CGPoint) {
        switch (self) {
        case .TOP:
            return (CGPointMake(0, 0), CGPointMake(0, 1))
        case .BOTTOM:
            return (CGPointMake(0, 1), CGPointMake(0, 0))
        case .LEFT:
            return (CGPointMake(0, 0), CGPointMake(1, 0))
        case .RIGHT:
            return (CGPointMake(1, 0), CGPointMake(0, 0))
        }
    }
}

extension UIImageView {
    
    static private let GRADIENT_SIZE: CGFloat = 15.0
    
    func addGradientLayer(baseColor:UIColor) {
        for side in ViewSide.allValues {
            let gradient = CAGradientLayer()
            gradient.colors = gradientColors(baseColor)
            gradient.frame = side.gradationFrame(self)
            gradient.startPoint = side.points().start
            gradient.endPoint = side.points().end
            self.layer.insertSublayer(gradient, atIndex: 0)
        }
        self.image = self.getImageFromView()
        removeGradientLayer()
    }
    
    private func gradientColors(baseColor:UIColor) -> [CGColor] {
        let startColor = baseColor.CGColor
        let clearColor = baseColor.colorWithAlphaComponent(0.0).CGColor
        return [startColor, clearColor]
    }
    
    private func removeGradientLayer() {
        self.layer.sublayers?.forEach({$0.removeFromSuperlayer()})
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
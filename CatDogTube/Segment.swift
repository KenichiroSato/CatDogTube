//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

class Segment : NSObject {

    private let ICON_SIZE : CGFloat = 45.0
    
    let contentType:ContentType
    
    var iconImage:UIImage {
        get {
            return UIImage.named(iconName(), size: CGSize(width: ICON_SIZE, height: ICON_SIZE))!
        }
    }

    private func iconName() -> String {
        switch self.contentType {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
    
    let viewController: UIViewController
    
    let presenter: LoadVideoPresenter
    
    init(vc:UIViewController, contentType:ContentType, presenter: LoadVideoPresenter) {
        self.viewController = vc
        self.contentType = contentType
        self.presenter = presenter
        super.init()
    }

}

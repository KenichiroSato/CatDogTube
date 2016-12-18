//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import CatDogTubeDomain

class Segment : NSObject, SegmentProtocol {

    let contentType:ContentType
    
    let view: SegmentContract_View
    
    let presenter: SegmentContract_Presenter
    
    init(view:SegmentContract_View, contentType:ContentType, presenter: SegmentContract_Presenter) {
        self.view = view
        self.contentType = contentType
        self.presenter = presenter
        super.init()
    }

    //MARK: SegmentProtocol
    func iconName() -> String {
        switch self.contentType {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }

}

//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import CatDogTubeDomain

class SearchSegment : NSObject, SegmentProtocol {

    let contentType:ContentType
    
    let _view: SegmentContract_View
    
    let presenter: SegmentContract_Presenter
    
    init(view:SegmentContract_View, contentType:ContentType, presenter: SegmentContract_Presenter) {
        self._view = view
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
    
    func view() -> SegmentContract_View {
        return _view
    }

}

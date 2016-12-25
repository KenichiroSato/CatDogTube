//
//  SegmentedItem.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/02/14.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

public class SearchSegment : NSObject, SegmentProtocol {

    public let contentType:ContentType
    
    let _view: SegmentContract_View
    
    public let presenter: SegmentContract_Presenter
    
    public init(view:SegmentContract_View, contentType:ContentType, presenter: SegmentContract_Presenter) {
        self._view = view
        self.contentType = contentType
        self.presenter = presenter
        super.init()
    }

    //MARK: SegmentProtocol
    public func iconName() -> String {
        switch self.contentType {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
    
    public func view() -> SegmentContract_View {
        return _view
    }

}

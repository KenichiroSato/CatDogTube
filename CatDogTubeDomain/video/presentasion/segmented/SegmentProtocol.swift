//
//  SegmentProtocol.swift
//  CatDogTube
//
//  Created by ken on 2016/12/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SegmentProtocol {
    func iconName() -> String
    
    func view() -> SegmentContract_View
}

//
//  SegmentedContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SegmentedContract_View {
    func show(segments: [SegmentProtocol])
}

public protocol SegmentedContract_Presenter {
    
    func loadSegments()
}

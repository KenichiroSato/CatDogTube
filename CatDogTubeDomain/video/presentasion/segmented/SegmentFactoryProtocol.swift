//
//  SegmentFactoryProtocol.swift
//  CatDogTube
//
//  Created by 2ndDisplay on 2016/12/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SegmentFactoryProtocol {
    func createSegments(with playerPresenter:PlayerContract_Presenter) -> [SegmentProtocol]
}

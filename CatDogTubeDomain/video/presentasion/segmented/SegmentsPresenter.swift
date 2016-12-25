//
//  SegmentsPresenter.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

public class SegmentsPresenter: SegmentedContract_Presenter {

    private var view: SegmentedContract_View
    
    private let playerPresenter: PlayerContract_Presenter
    
    private let segmentFactory: SegmentFactoryProtocol
    
    public init(view: SegmentedContract_View,
         playerPresenter: PlayerContract_Presenter,
         segmentFactory: SegmentFactoryProtocol) {
        self.view = view
        self.playerPresenter = playerPresenter
        self.segmentFactory = segmentFactory
    }
    
    public func loadSegments() {
        let segments = segmentFactory.createSegments(with: playerPresenter)
        view.show(segments: segments)
    }
    
}

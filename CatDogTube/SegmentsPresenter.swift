//
//  SegmentsPresenter.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

class SegmentsPresenter: SegmentedContract_Presenter {

    private var view: SegmentedContract_View
    
    private let playerPresenter: PlayerContract_Presenter
    
    init(view: SegmentedContract_View, playerPresenter: PlayerContract_Presenter) {
        self.view = view
        self.playerPresenter = playerPresenter
    }
    
    func loadSegments() {
        let segments = SegmentFactory.generate(with: playerPresenter)
        view.show(segments: segments)
    }
    
}

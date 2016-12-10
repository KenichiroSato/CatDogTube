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
    
    init(view: SegmentedContract_View) {
        self.view = view
    }
    
    func loadSegments() {
        let segments = SegmentFactory.generate()
        view.show(segments: segments)
    }
    
}

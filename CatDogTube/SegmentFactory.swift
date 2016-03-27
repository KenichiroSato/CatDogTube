//
//  SegmentItems.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class SegmentFactory: NSObject {
    
    class func generate() -> [Segment] {
        
        var segments: [Segment] = []
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let catVc = storyboard.instantiateViewControllerWithIdentifier(
            VideoCollectionVC.IDENTIFIER) as? VideoCollectionVC {
            
            let catUseCase = SearchVideoUseCase(word: Text.SEARCH_WORD_CAT,
                                                repo: YouTubeDataStore())
            let catPresenter = LoadVideoPresenter(useCase: catUseCase)
            catVc.presenter = catPresenter
            
            let catSegment = Segment(vc: catVc, iconName: "cat")
            
            segments.append(catSegment)
        }
            
        if let dogVc = storyboard.instantiateViewControllerWithIdentifier(
            VideoCollectionVC.IDENTIFIER) as? VideoCollectionVC {
            
            let dogUseCase = SearchVideoUseCase(word: Text.SEARCH_WORD_DOG,
                                                repo: YouTubeDataStore())
            let dogPresenter = LoadVideoPresenter(useCase: dogUseCase)
            dogVc.presenter = dogPresenter
            
            let dogSegment = Segment(vc: dogVc, iconName: "dog")
            
            segments.append(dogSegment)
        }
        
        return segments
    }
    
}
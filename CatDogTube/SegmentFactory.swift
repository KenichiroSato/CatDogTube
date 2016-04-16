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
        segments.append(segmentWithContentType(ContentType.CAT))
        segments.append(segmentWithContentType(ContentType.DOG))
        return segments
    }
    
    private class func segmentWithContentType(contentType:ContentType) -> Segment {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(
            VideoCollectionVC.IDENTIFIER) as! VideoCollectionVC
                
        let useCase = SearchVideoUseCase(content: contentType,
                                         repo: YouTubeDataStore())
        let presenter = LoadVideoPresenter(useCase: useCase)
        vc.presenter = presenter
        
        return Segment(vc: vc, iconName: contentType.iconName())
    }
}
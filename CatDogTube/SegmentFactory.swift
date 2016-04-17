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
        segments.append(searchSegment(ContentType.CAT))
        segments.append(searchSegment(ContentType.DOG))
        segments.append(favoriteSegment())
        return segments
    }
    
    private class func searchSegment(contentType:ContentType) -> Segment {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(
            VideoCollectionVC.IDENTIFIER) as! VideoCollectionVC
                
        let useCase = SearchVideoUseCase(content: contentType,
                                         repo: YouTubeRepository())
        let presenter = LoadVideoPresenter(useCase: useCase)
        vc.presenter = presenter
        
        return Segment(vc: vc, iconName: contentType.iconName())
    }
    
    private class func favoriteSegment() -> Segment {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(
            VideoCollectionVC.IDENTIFIER) as! VideoCollectionVC
        
        let useCase = FavoriteListUseCase(repo: DummyFavoritesRepository())
        let presenter = LoadVideoPresenter(useCase: useCase)
        vc.presenter = presenter
        
        return Segment(vc: vc, iconName: ContentType.CAT.iconName())
        
    }
}
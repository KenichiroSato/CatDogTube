//
//  SegmentItems.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

class SegmentFactory: NSObject {
    
    class func generate() -> [Segment] {
        
        let catSegment = searchSegment(ContentType.cat)
        let dogSegment = searchSegment(ContentType.dog)
        
        if let team = TeamUseCase.create().loadTeam(), team.isDogTeam() {
            return [dogSegment, catSegment]
        } else {
            return [catSegment, dogSegment]
        }
    }
    
    private class func searchSegment(_ contentType:ContentType) -> Segment {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = SearchVideoUseCase(content: contentType,
                                         repo:  SearchVideoRepository(dataSource: YouTubeDataSource()))
        let presenter = LoadVideoPresenter(useCase: useCase, executor:ThreadExecutor())
        vc.presenter = presenter
        
        return Segment(vc: vc, contentType: contentType)
    }
    
    private class func favoriteSegment() -> Segment {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = FavoriteListUseCase.create()
        let presenter = LoadVideoPresenter(useCase: useCase, executor:ThreadExecutor())
        vc.presenter = presenter
        
        return Segment(vc: vc, contentType: ContentType.cat)
    }
}

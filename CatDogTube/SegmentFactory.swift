//
//  SegmentItems.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

class SegmentFactory: NSObject {
    
    class func generate(with playerPresenter:PlayerContract_Presenter) -> [Segment] {
        
        let catSegment = searchSegment(ContentType.cat, playerPresenter: playerPresenter)
        let dogSegment = searchSegment(ContentType.dog, playerPresenter: playerPresenter)

        if let team = TeamUseCase.create().loadTeam(), team.isDogTeam() {
            dogSegment.presenter.markAsPrimal()
            return [dogSegment, catSegment]
        } else {
            catSegment.presenter.markAsPrimal()
            return [catSegment, dogSegment]
        }
    }
    
    private class func searchSegment(_ contentType:ContentType, playerPresenter:PlayerContract_Presenter) -> Segment {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = SearchVideoUseCase(content: contentType,
                                         repo:  SearchVideoRepository(dataSource: YouTubeDataSource()),
                                         wordProvider:SearchWordProvider())
        let presenter = LoadVideoPresenter(
            useCase: useCase, executor:ThreadExecutor(), playerPresenter:playerPresenter)
        vc.presenter = presenter
        
        return Segment(vc: vc, contentType: contentType, presenter:presenter)
    }
    
    private class func favoriteSegment(_ playerPresenter:PlayerContract_Presenter) -> Segment {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = FavoriteListUseCase.create()
        let presenter = LoadVideoPresenter(
            useCase: useCase, executor:ThreadExecutor(), playerPresenter:playerPresenter)
        vc.presenter = presenter
        
        return Segment(vc: vc, contentType: ContentType.cat, presenter:presenter)
    }
}

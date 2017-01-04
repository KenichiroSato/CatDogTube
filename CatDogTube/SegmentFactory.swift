//
//  SegmentItems.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit
import CatDogTubeDomain

class SegmentFactory: SegmentFactoryProtocol {
    
    //MARK: SegmentFactoryProtocol
    func createSegments(with playerPresenter:PlayerContract_Presenter) -> [SegmentProtocol] {

        let catSegment = searchSegment(ContentType.cat, playerPresenter: playerPresenter)
        let dogSegment = searchSegment(ContentType.dog, playerPresenter: playerPresenter)

        let repo = TeamRepository(dataSource: UserDefaultsDataSource())
        let useCase = TeamUseCase(repo: repo, sender: nil)
        if let team = useCase.loadTeam(), team.isDogTeam() {
            dogSegment.presenter.markAsPrimal()
            return [dogSegment, catSegment]
        } else {
            catSegment.presenter.markAsPrimal()
            return [catSegment, dogSegment]
        }
    }
    
    private func searchSegment(_ contentType:ContentType, playerPresenter:PlayerContract_Presenter) -> SearchSegment {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = SearchVideoUseCase(content: contentType,
                                         repo:  SearchVideoRepository(dataSource: YouTubeDataSource()),
                                         wordProvider:SearchWordProvider())
        let presenter = LoadVideoPresenter(
            useCase: useCase, executor:ThreadExecutor(), playerPresenter:playerPresenter)
        vc.presenter = presenter
        
        return SearchSegment(view: vc, contentType: contentType, presenter:presenter)
    }
    
    /*
    private class func favoriteSegment(_ playerPresenter:PlayerContract_Presenter) -> SegmentProtocol {
        let vc = UIStoryboard.instantiateVcWithId(VideoCollectionVC.ID)
            as! VideoCollectionVC
        
        let useCase = FavoriteListUseCase.create()
        let presenter = LoadVideoPresenter(
            useCase: useCase, executor:ThreadExecutor(), playerPresenter:playerPresenter)
        vc.presenter = presenter
        
        return Segment(view: vc, contentType: ContentType.cat, presenter:presenter)
    }
 */
}

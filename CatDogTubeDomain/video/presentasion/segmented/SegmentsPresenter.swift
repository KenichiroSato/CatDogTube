//
//  SegmentsPresenter.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public class SegmentsPresenter: SegmentedContract_Presenter, TeamNotificationContract_Receiver {

    private var view: SegmentedContract_View
    
    private let playerPresenter: PlayerContract_Presenter
    
    private let segmentFactory: SegmentFactoryProtocol
    
    private var segments: [SegmentProtocol] = []
    
    private var notificationAdopter: TeamNotificationContract_ReceiveAdopter?
    
    public init(view: SegmentedContract_View,
         playerPresenter: PlayerContract_Presenter,
         segmentFactory: SegmentFactoryProtocol) {
        self.view = view
        self.playerPresenter = playerPresenter
        self.segmentFactory = segmentFactory
    }
    
    //MARK: SegmentedContract_Presenter
    public func loadSegments() {
        segments = segmentFactory.createSegments(with: playerPresenter)
        view.show(segments: segments)
    }
    
    //MARK: TeamNotificationContract_Receiver
    public func set(adopter: TeamNotificationContract_ReceiveAdopter) {
        notificationAdopter = adopter
    }
    
    public func onSelected(team: Team) {
        guard let firstSegment = segments.first as? SearchSegment,
            team.contentType != firstSegment.contentType else {
                return
        }
        segments.reverse()
        view.reorder(segments: segments)
    }
    
}

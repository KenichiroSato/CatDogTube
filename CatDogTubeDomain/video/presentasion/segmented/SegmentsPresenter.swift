//
//  SegmentsPresenter.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public class SegmentsPresenter: SegmentedContract_Presenter {

    //FIXME delete this
    let NAME_TEAM_SAVED = Notification.Name("team_saved")
    let KEY_TEAM = "team"

    private var view: SegmentedContract_View
    
    private let playerPresenter: PlayerContract_Presenter
    
    private let segmentFactory: SegmentFactoryProtocol
    
    private var segments: [SegmentProtocol] = []
    
    public init(view: SegmentedContract_View,
         playerPresenter: PlayerContract_Presenter,
         segmentFactory: SegmentFactoryProtocol) {
        self.view = view
        self.playerPresenter = playerPresenter
        self.segmentFactory = segmentFactory
        registerNotificationObserver()
    }
    
    private func registerNotificationObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(reorderTabs(notification:)),
            name:NAME_TEAM_SAVED , object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self, name: NAME_TEAM_SAVED, object: nil)
    }

    
    public func loadSegments() {
        segments = segmentFactory.createSegments(with: playerPresenter)
        view.show(segments: segments)
    }
    
    @objc private func reorderTabs(notification: NSNotification) {
        guard let team = notification.userInfo?[KEY_TEAM] as? Team else {
            return
        }
        view.reorderTabs(team: team)
    }

    
}

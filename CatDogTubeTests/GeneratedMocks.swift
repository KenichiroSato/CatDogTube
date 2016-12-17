// MARK: - Mocks generated from file: CatDogTube/LoadVideoUseCase.swift at 2016-12-17 00:31:54 +0000

//
//  UseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockLoadVideoUseCase: LoadVideoUseCase, Cuckoo.Mock {
    typealias MocksType = LoadVideoUseCase
    typealias Stubbing = __StubbingProxy_LoadVideoUseCase
    typealias Verification = __VerificationProxy_LoadVideoUseCase
    let manager = Cuckoo.MockManager()
    
    private var observed: LoadVideoUseCase?
    
    func spy(on victim: LoadVideoUseCase) -> Self {
        observed = victim
        return self
    }
    
    func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        return manager.call("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", parameters: (completionHandler), original: observed.map { o in return { (completionHandler: @escaping (_ videos:[Video]?) -> Void) in o.loadVideos(completionHandler) } })
    }
    
    struct __StubbingProxy_LoadVideoUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.StubNoReturnFunction<((_ videos:[Video]?) -> Void)> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_LoadVideoUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return manager.verify("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class LoadVideoUseCaseStub: LoadVideoUseCase {
    
    func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

// MARK: - Mocks generated from file: CatDogTube/PlayerContract.swift at 2016-12-17 00:31:54 +0000

//
//  PlayContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockPlayerContract_View: PlayerContract_View, Cuckoo.Mock {
    typealias MocksType = PlayerContract_View
    typealias Stubbing = __StubbingProxy_PlayerContract_View
    typealias Verification = __VerificationProxy_PlayerContract_View
    let manager = Cuckoo.MockManager()
    
    private var observed: PlayerContract_View?
    
    func spy(on victim: PlayerContract_View) -> Self {
        observed = victim
        return self
    }
    
    func loadPlayerView(with videoId: String) -> Bool {
        return manager.call("loadPlayerView(with: String) -> Bool", parameters: (videoId), original: observed.map { o in return { (videoId: String) -> Bool in o.loadPlayerView(with: videoId) } })
    }
    
    func loadVideo(with videoId: String) {
        return manager.call("loadVideo(with: String)", parameters: (videoId), original: observed.map { o in return { (videoId: String) in o.loadVideo(with: videoId) } })
    }
    
    func play() {
        return manager.call("play()", parameters: (), original: observed.map { o in return { () in o.play() } })
    }
    
    func pause() {
        return manager.call("pause()", parameters: (), original: observed.map { o in return { () in o.pause() } })
    }
    
    func showPlayer() {
        return manager.call("showPlayer()", parameters: (), original: observed.map { o in return { () in o.showPlayer() } })
    }
    
    struct __StubbingProxy_PlayerContract_View: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubFunction<(String), Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("loadPlayerView(with: String) -> Bool", parameterMatchers: matchers))
        }
        
        func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideo(with: String)", parameterMatchers: matchers))
        }
        
        func play() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("play()", parameterMatchers: []))
        }
        
        func pause() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("pause()", parameterMatchers: []))
        }
        
        func showPlayer() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showPlayer()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_PlayerContract_View: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return manager.verify("loadPlayerView(with: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return manager.verify("loadVideo(with: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func play() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("play()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func pause() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("pause()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showPlayer() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showPlayer()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class PlayerContract_ViewStub: PlayerContract_View {
    
    func loadPlayerView(with videoId: String) -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
    func loadVideo(with videoId: String) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func play() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func pause() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func showPlayer() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

class MockPlayerContract_Presenter: PlayerContract_Presenter, Cuckoo.Mock {
    typealias MocksType = PlayerContract_Presenter
    typealias Stubbing = __StubbingProxy_PlayerContract_Presenter
    typealias Verification = __VerificationProxy_PlayerContract_Presenter
    let manager = Cuckoo.MockManager()
    
    private var observed: PlayerContract_Presenter?
    
    func spy(on victim: PlayerContract_Presenter) -> Self {
        observed = victim
        return self
    }
    
    func onVideoLoaded(_ videos: [Video]) {
        return manager.call("onVideoLoaded(_: [Video])", parameters: (videos), original: observed.map { o in return { (videos: [Video]) in o.onVideoLoaded(videos) } })
    }
    
    func onVideoTapped(_ video: Video) {
        return manager.call("onVideoTapped(_: Video)", parameters: (video), original: observed.map { o in return { (video: Video) in o.onVideoTapped(video) } })
    }
    
    struct __StubbingProxy_PlayerContract_Presenter: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoLoaded(_: [Video])", parameterMatchers: matchers))
        }
        
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_PlayerContract_Presenter: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return manager.verify("onVideoLoaded(_: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class PlayerContract_PresenterStub: PlayerContract_Presenter {
    
    func onVideoLoaded(_ videos: [Video]) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func onVideoTapped(_ video: Video) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

// MARK: - Mocks generated from file: CatDogTube/Team.swift at 2016-12-17 00:31:54 +0000

//
//  Team.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockTeam: Team, Cuckoo.Mock {
    typealias MocksType = Team
    typealias Stubbing = __StubbingProxy_Team
    typealias Verification = __VerificationProxy_Team
    let manager = Cuckoo.MockManager()
    
    private var observed: Team?
    
    func spy(on victim: Team) -> Self {
        observed = victim
        return self
    }
    
    override func nameString() -> String {
        return manager.call("nameString() -> String", parameters: (), original: observed.map { o in return { () -> String in o.nameString() } })
    }
    
    override func isDogTeam() -> Bool {
        return manager.call("isDogTeam() -> Bool", parameters: (), original: observed.map { o in return { () -> Bool in o.isDogTeam() } })
    }
    
    struct __StubbingProxy_Team: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func nameString() -> Cuckoo.StubFunction<(), String> {
            return Cuckoo.StubFunction(stub: manager.createStub("nameString() -> String", parameterMatchers: []))
        }
        
        func isDogTeam() -> Cuckoo.StubFunction<(), Bool> {
            return Cuckoo.StubFunction(stub: manager.createStub("isDogTeam() -> Bool", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_Team: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func nameString() -> Cuckoo.__DoNotUse<String> {
            return manager.verify("nameString() -> String", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func isDogTeam() -> Cuckoo.__DoNotUse<Bool> {
            return manager.verify("isDogTeam() -> Bool", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class TeamStub: Team {
    
    override func nameString() -> String {
        return DefaultValueRegistry.defaultValue(for: String.self)
    }
    
    override func isDogTeam() -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
}

// MARK: - Mocks generated from file: CatDogTube/Video.swift at 2016-12-17 00:31:54 +0000

//
//  Video.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockVideo: Video, Cuckoo.Mock {
    typealias MocksType = Video
    typealias Stubbing = __StubbingProxy_Video
    typealias Verification = __VerificationProxy_Video
    let manager = Cuckoo.MockManager()
    
    private var observed: Video?
    
    func spy(on victim: Video) -> Self {
        observed = victim
        return self
    }
    
    override var description: String {
        get {
            return manager.getter("description", original: observed.map { o in return { () -> String in o.description } })
        }
    }
    
    struct __StubbingProxy_Video: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var description: Cuckoo.ToBeStubbedReadOnlyProperty<String> {
            return Cuckoo.ToBeStubbedReadOnlyProperty(manager: manager, name: "description")
        }
    }
    
    struct __VerificationProxy_Video: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var description: Cuckoo.VerifyReadOnlyProperty<String> {
            return Cuckoo.VerifyReadOnlyProperty(manager: manager, name: "description", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
    }
}

class VideoStub: Video {
    
    override var description: String {
        get {
            return DefaultValueRegistry.defaultValue(for: String.self)
        }
    }
}

// MARK: - Mocks generated from file: CatDogTube/VideoCollectionContract.swift at 2016-12-17 00:31:54 +0000

//
//  VideoCollectionContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockVideoCollectionContract_View: VideoCollectionContract_View, Cuckoo.Mock {
    typealias MocksType = VideoCollectionContract_View
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_View
    typealias Verification = __VerificationProxy_VideoCollectionContract_View
    let manager = Cuckoo.MockManager()
    
    private var observed: VideoCollectionContract_View?
    
    func spy(on victim: VideoCollectionContract_View) -> Self {
        observed = victim
        return self
    }
    
    func show(videos: [Video]) {
        return manager.call("show(videos: [Video])", parameters: (videos), original: observed.map { o in return { (videos: [Video]) in o.show(videos: videos) } })
    }
    
    func showErrorUI() {
        return manager.call("showErrorUI()", parameters: (), original: observed.map { o in return { () in o.showErrorUI() } })
    }
    
    func hideErrorUI() {
        return manager.call("hideErrorUI()", parameters: (), original: observed.map { o in return { () in o.hideErrorUI() } })
    }
    
    func showLoadingIndicator() {
        return manager.call("showLoadingIndicator()", parameters: (), original: observed.map { o in return { () in o.showLoadingIndicator() } })
    }
    
    struct __StubbingProxy_VideoCollectionContract_View: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("show(videos: [Video])", parameterMatchers: matchers))
        }
        
        func showErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showErrorUI()", parameterMatchers: []))
        }
        
        func hideErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("hideErrorUI()", parameterMatchers: []))
        }
        
        func showLoadingIndicator() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showLoadingIndicator()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_VideoCollectionContract_View: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return manager.verify("show(videos: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showErrorUI() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showErrorUI()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func hideErrorUI() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("hideErrorUI()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showLoadingIndicator()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class VideoCollectionContract_ViewStub: VideoCollectionContract_View {
    
    func show(videos: [Video]) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func showErrorUI() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func hideErrorUI() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func showLoadingIndicator() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

class MockVideoCollectionContract_Presenter: VideoCollectionContract_Presenter, Cuckoo.Mock {
    typealias MocksType = VideoCollectionContract_Presenter
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_Presenter
    typealias Verification = __VerificationProxy_VideoCollectionContract_Presenter
    let manager = Cuckoo.MockManager()
    
    private var observed: VideoCollectionContract_Presenter?
    
    func spy(on victim: VideoCollectionContract_Presenter) -> Self {
        observed = victim
        return self
    }
    
    func set(view: VideoCollectionContract_View) {
        return manager.call("set(view: VideoCollectionContract_View)", parameters: (view), original: observed.map { o in return { (view: VideoCollectionContract_View) in o.set(view: view) } })
    }
    
    func loadVideo(withFullScreenIndicator: Bool) {
        return manager.call("loadVideo(withFullScreenIndicator: Bool)", parameters: (withFullScreenIndicator), original: observed.map { o in return { (withFullScreenIndicator: Bool) in o.loadVideo(withFullScreenIndicator: withFullScreenIndicator) } })
    }
    
    func markAsPrimal() {
        return manager.call("markAsPrimal()", parameters: (), original: observed.map { o in return { () in o.markAsPrimal() } })
    }
    
    func onVideoTapped(_ video: Video) {
        return manager.call("onVideoTapped(_: Video)", parameters: (video), original: observed.map { o in return { (video: Video) in o.onVideoTapped(video) } })
    }
    
    struct __StubbingProxy_VideoCollectionContract_Presenter: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func set<M1: Cuckoo.Matchable>(view: M1) -> Cuckoo.StubNoReturnFunction<(VideoCollectionContract_View)> where M1.MatchedType == VideoCollectionContract_View {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_View)>] = [wrap(matchable: view) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("set(view: VideoCollectionContract_View)", parameterMatchers: matchers))
        }
        
        func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideo(withFullScreenIndicator: Bool)", parameterMatchers: matchers))
        }
        
        func markAsPrimal() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("markAsPrimal()", parameterMatchers: []))
        }
        
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_VideoCollectionContract_Presenter: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func set<M1: Cuckoo.Matchable>(view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == VideoCollectionContract_View {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_View)>] = [wrap(matchable: view) { $0 }]
            return manager.verify("set(view: VideoCollectionContract_View)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return manager.verify("loadVideo(withFullScreenIndicator: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func markAsPrimal() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("markAsPrimal()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class VideoCollectionContract_PresenterStub: VideoCollectionContract_Presenter {
    
    func set(view: VideoCollectionContract_View) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func loadVideo(withFullScreenIndicator: Bool) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func markAsPrimal() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    func onVideoTapped(_ video: Video) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

// MARK: - Mocks generated from file: CatDogTube/TeamRepository.swift at 2016-12-17 00:31:54 +0000

//
//  TeamRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import Foundation

class MockTeamDataSourceProtocol: TeamDataSourceProtocol, Cuckoo.Mock {
    typealias MocksType = TeamDataSourceProtocol
    typealias Stubbing = __StubbingProxy_TeamDataSourceProtocol
    typealias Verification = __VerificationProxy_TeamDataSourceProtocol
    let manager = Cuckoo.MockManager()
    
    private var observed: TeamDataSourceProtocol?
    
    func spy(on victim: TeamDataSourceProtocol) -> Self {
        observed = victim
        return self
    }
    
    func loadTeamName() -> String? {
        return manager.call("loadTeamName() -> String?", parameters: (), original: observed.map { o in return { () -> String? in o.loadTeamName() } })
    }
    
    func save(teamName: String) {
        return manager.call("save(teamName: String)", parameters: (teamName), original: observed.map { o in return { (teamName: String) in o.save(teamName: teamName) } })
    }
    
    struct __StubbingProxy_TeamDataSourceProtocol: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func loadTeamName() -> Cuckoo.StubFunction<(), String?> {
            return Cuckoo.StubFunction(stub: manager.createStub("loadTeamName() -> String?", parameterMatchers: []))
        }
        
        func save<M1: Cuckoo.Matchable>(teamName: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: teamName) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(teamName: String)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_TeamDataSourceProtocol: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func loadTeamName() -> Cuckoo.__DoNotUse<String?> {
            return manager.verify("loadTeamName() -> String?", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(teamName: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: teamName) { $0 }]
            return manager.verify("save(teamName: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class TeamDataSourceProtocolStub: TeamDataSourceProtocol {
    
    func loadTeamName() -> String? {
        return DefaultValueRegistry.defaultValue(for: Optional<String>.self)
    }
    
    func save(teamName: String) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

class MockTeamRepository: TeamRepository, Cuckoo.Mock {
    typealias MocksType = TeamRepository
    typealias Stubbing = __StubbingProxy_TeamRepository
    typealias Verification = __VerificationProxy_TeamRepository
    let manager = Cuckoo.MockManager()
    
    private var observed: TeamRepository?
    
    func spy(on victim: TeamRepository) -> Self {
        observed = victim
        return self
    }
    
    override func loadTeam() -> Team? {
        return manager.call("loadTeam() -> Team?", parameters: (), original: observed.map { o in return { () -> Team? in o.loadTeam() } })
    }
    
    override func save(team: Team) {
        return manager.call("save(team: Team)", parameters: (team), original: observed.map { o in return { (team: Team) in o.save(team: team) } })
    }
    
    struct __StubbingProxy_TeamRepository: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func loadTeam() -> Cuckoo.StubFunction<(), Team?> {
            return Cuckoo.StubFunction(stub: manager.createStub("loadTeam() -> Team?", parameterMatchers: []))
        }
        
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.StubNoReturnFunction<(Team)> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(team: Team)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_TeamRepository: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func loadTeam() -> Cuckoo.__DoNotUse<Team?> {
            return manager.verify("loadTeam() -> Team?", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return manager.verify("save(team: Team)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class TeamRepositoryStub: TeamRepository {
    
    override func loadTeam() -> Team? {
        return DefaultValueRegistry.defaultValue(for: Optional<Team>.self)
    }
    
    override func save(team: Team) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

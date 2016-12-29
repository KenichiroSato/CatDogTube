// MARK: - Mocks generated from file: CatDogTubeDomain/player/presentation/PlayerContract.swift at 2016-12-29 03:43:33 +0000

//
//  PlayContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/10.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

public class MockPlayerContract_View: PlayerContract_View, Cuckoo.Mock {
    public typealias MocksType = PlayerContract_View
    public typealias Stubbing = __StubbingProxy_PlayerContract_View
    public typealias Verification = __VerificationProxy_PlayerContract_View
    public let manager = Cuckoo.MockManager()
    
    private var observed: PlayerContract_View?
    
    public func spy(on victim: PlayerContract_View) -> Self {
        observed = victim
        return self
    }
    
    public func loadPlayerView(with videoId: String) -> Bool {
        return manager.call("loadPlayerView(with: String) -> Bool", parameters: (videoId), original: observed.map { o in return { (videoId: String) -> Bool in o.loadPlayerView(with: videoId) } })
    }
    
    public func loadVideo(with videoId: String) {
        return manager.call("loadVideo(with: String)", parameters: (videoId), original: observed.map { o in return { (videoId: String) in o.loadVideo(with: videoId) } })
    }
    
    public func play() {
        return manager.call("play()", parameters: (), original: observed.map { o in return { () in o.play() } })
    }
    
    public func pause() {
        return manager.call("pause()", parameters: (), original: observed.map { o in return { () in o.pause() } })
    }
    
    public func showPlayer() {
        return manager.call("showPlayer()", parameters: (), original: observed.map { o in return { () in o.showPlayer() } })
    }
    
    public struct __StubbingProxy_PlayerContract_View: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubFunction<(String), Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("loadPlayerView(with: String) -> Bool", parameterMatchers: matchers))
        }
        
        public func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideo(with: String)", parameterMatchers: matchers))
        }
        
        public func play() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("play()", parameterMatchers: []))
        }
        
        public func pause() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("pause()", parameterMatchers: []))
        }
        
        public func showPlayer() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showPlayer()", parameterMatchers: []))
        }
    }
    
    public struct __VerificationProxy_PlayerContract_View: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return manager.verify("loadPlayerView(with: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return manager.verify("loadVideo(with: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func play() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("play()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func pause() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("pause()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func showPlayer() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showPlayer()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

public class PlayerContract_ViewStub: PlayerContract_View {
    
    public func loadPlayerView(with videoId: String) -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
    public func loadVideo(with videoId: String) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func play() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func pause() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showPlayer() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

public class MockPlayerContract_Presenter: PlayerContract_Presenter, Cuckoo.Mock {
    public typealias MocksType = PlayerContract_Presenter
    public typealias Stubbing = __StubbingProxy_PlayerContract_Presenter
    public typealias Verification = __VerificationProxy_PlayerContract_Presenter
    public let manager = Cuckoo.MockManager()
    
    private var observed: PlayerContract_Presenter?
    
    public func spy(on victim: PlayerContract_Presenter) -> Self {
        observed = victim
        return self
    }
    
    public func onVideoLoaded(_ videos: [Video]) {
        return manager.call("onVideoLoaded(_: [Video])", parameters: (videos), original: observed.map { o in return { (videos: [Video]) in o.onVideoLoaded(videos) } })
    }
    
    public func onVideoTapped(_ video: Video) {
        return manager.call("onVideoTapped(_: Video)", parameters: (video), original: observed.map { o in return { (video: Video) in o.onVideoTapped(video) } })
    }
    
    public struct __StubbingProxy_PlayerContract_Presenter: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoLoaded(_: [Video])", parameterMatchers: matchers))
        }
        
        public func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
    }
    
    public struct __VerificationProxy_PlayerContract_Presenter: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return manager.verify("onVideoLoaded(_: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

public class PlayerContract_PresenterStub: PlayerContract_Presenter {
    
    public func onVideoLoaded(_ videos: [Video]) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onVideoTapped(_ video: Video) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/LoadVideoUseCase.swift at 2016-12-29 03:43:33 +0000

//
//  UseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

public class MockLoadVideoUseCase: LoadVideoUseCase, Cuckoo.Mock {
    public typealias MocksType = LoadVideoUseCase
    public typealias Stubbing = __StubbingProxy_LoadVideoUseCase
    public typealias Verification = __VerificationProxy_LoadVideoUseCase
    public let manager = Cuckoo.MockManager()
    
    private var observed: LoadVideoUseCase?
    
    public func spy(on victim: LoadVideoUseCase) -> Self {
        observed = victim
        return self
    }
    
    public func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        return manager.call("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", parameters: (completionHandler), original: observed.map { o in return { (completionHandler: @escaping (_ videos:[Video]?) -> Void) in o.loadVideos(completionHandler) } })
    }
    
    public struct __StubbingProxy_LoadVideoUseCase: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.StubNoReturnFunction<((_ videos:[Video]?) -> Void)> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", parameterMatchers: matchers))
        }
    }
    
    public struct __VerificationProxy_LoadVideoUseCase: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return manager.verify("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

public class LoadVideoUseCaseStub: LoadVideoUseCase {
    
    public func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/model/Video.swift at 2016-12-29 03:43:33 +0000

//
//  Video.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

public class MockVideo: Video, Cuckoo.Mock {
    public typealias MocksType = Video
    public typealias Stubbing = __StubbingProxy_Video
    public typealias Verification = __VerificationProxy_Video
    public let manager = Cuckoo.MockManager()
    
    private var observed: Video?
    
    public func spy(on victim: Video) -> Self {
        observed = victim
        return self
    }
    
    public override var description: String {
        get {
            return manager.getter("description", original: observed.map { o in return { () -> String in o.description } })
        }
    }
    
    public struct __StubbingProxy_Video: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var description: Cuckoo.ToBeStubbedReadOnlyProperty<String> {
            return Cuckoo.ToBeStubbedReadOnlyProperty(manager: manager, name: "description")
        }
    }
    
    public struct __VerificationProxy_Video: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var description: Cuckoo.VerifyReadOnlyProperty<String> {
            return Cuckoo.VerifyReadOnlyProperty(manager: manager, name: "description", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
    }
}

public class VideoStub: Video {
    
    public override var description: String {
        get {
            return DefaultValueRegistry.defaultValue(for: String.self)
        }
    }
}

// MARK: - Mocks generated from file: CatDogTubeDomain/video/presentasion/collection/VideoCollectionContract.swift at 2016-12-29 03:43:33 +0000

//
//  VideoCollectionContract.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/11/20.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

public class MockVideoCollectionContract_View: VideoCollectionContract_View, Cuckoo.Mock {
    public typealias MocksType = VideoCollectionContract_View
    public typealias Stubbing = __StubbingProxy_VideoCollectionContract_View
    public typealias Verification = __VerificationProxy_VideoCollectionContract_View
    public let manager = Cuckoo.MockManager()
    
    private var observed: VideoCollectionContract_View?
    
    public func spy(on victim: VideoCollectionContract_View) -> Self {
        observed = victim
        return self
    }
    
    public func show(videos: [Video]) {
        return manager.call("show(videos: [Video])", parameters: (videos), original: observed.map { o in return { (videos: [Video]) in o.show(videos: videos) } })
    }
    
    public func showErrorUI() {
        return manager.call("showErrorUI()", parameters: (), original: observed.map { o in return { () in o.showErrorUI() } })
    }
    
    public func hideErrorUI() {
        return manager.call("hideErrorUI()", parameters: (), original: observed.map { o in return { () in o.hideErrorUI() } })
    }
    
    public func showLoadingIndicator() {
        return manager.call("showLoadingIndicator()", parameters: (), original: observed.map { o in return { () in o.showLoadingIndicator() } })
    }
    
    public struct __StubbingProxy_VideoCollectionContract_View: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("show(videos: [Video])", parameterMatchers: matchers))
        }
        
        public func showErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showErrorUI()", parameterMatchers: []))
        }
        
        public func hideErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("hideErrorUI()", parameterMatchers: []))
        }
        
        public func showLoadingIndicator() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showLoadingIndicator()", parameterMatchers: []))
        }
    }
    
    public struct __VerificationProxy_VideoCollectionContract_View: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return manager.verify("show(videos: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func showErrorUI() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showErrorUI()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func hideErrorUI() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("hideErrorUI()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func showLoadingIndicator() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("showLoadingIndicator()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

public class VideoCollectionContract_ViewStub: VideoCollectionContract_View {
    
    public func show(videos: [Video]) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showErrorUI() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func hideErrorUI() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showLoadingIndicator() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

public class MockVideoCollectionContract_Presenter: VideoCollectionContract_Presenter, Cuckoo.Mock {
    public typealias MocksType = VideoCollectionContract_Presenter
    public typealias Stubbing = __StubbingProxy_VideoCollectionContract_Presenter
    public typealias Verification = __VerificationProxy_VideoCollectionContract_Presenter
    public let manager = Cuckoo.MockManager()
    
    private var observed: VideoCollectionContract_Presenter?
    
    public func spy(on victim: VideoCollectionContract_Presenter) -> Self {
        observed = victim
        return self
    }
    
    public func set(view: VideoCollectionContract_View) {
        return manager.call("set(view: VideoCollectionContract_View)", parameters: (view), original: observed.map { o in return { (view: VideoCollectionContract_View) in o.set(view: view) } })
    }
    
    public func loadVideo(withFullScreenIndicator: Bool) {
        return manager.call("loadVideo(withFullScreenIndicator: Bool)", parameters: (withFullScreenIndicator), original: observed.map { o in return { (withFullScreenIndicator: Bool) in o.loadVideo(withFullScreenIndicator: withFullScreenIndicator) } })
    }
    
    public func markAsPrimal() {
        return manager.call("markAsPrimal()", parameters: (), original: observed.map { o in return { () in o.markAsPrimal() } })
    }
    
    public func onVideoTapped(_ video: Video) {
        return manager.call("onVideoTapped(_: Video)", parameters: (video), original: observed.map { o in return { (video: Video) in o.onVideoTapped(video) } })
    }
    
    public struct __StubbingProxy_VideoCollectionContract_Presenter: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func set<M1: Cuckoo.Matchable>(view: M1) -> Cuckoo.StubNoReturnFunction<(VideoCollectionContract_View)> where M1.MatchedType == VideoCollectionContract_View {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_View)>] = [wrap(matchable: view) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("set(view: VideoCollectionContract_View)", parameterMatchers: matchers))
        }
        
        public func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("loadVideo(withFullScreenIndicator: Bool)", parameterMatchers: matchers))
        }
        
        public func markAsPrimal() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("markAsPrimal()", parameterMatchers: []))
        }
        
        public func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
    }
    
    public struct __VerificationProxy_VideoCollectionContract_Presenter: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func set<M1: Cuckoo.Matchable>(view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == VideoCollectionContract_View {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_View)>] = [wrap(matchable: view) { $0 }]
            return manager.verify("set(view: VideoCollectionContract_View)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return manager.verify("loadVideo(withFullScreenIndicator: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func markAsPrimal() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("markAsPrimal()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

public class VideoCollectionContract_PresenterStub: VideoCollectionContract_Presenter {
    
    public func set(view: VideoCollectionContract_View) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func loadVideo(withFullScreenIndicator: Bool) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func markAsPrimal() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onVideoTapped(_ video: Video) {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

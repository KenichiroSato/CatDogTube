// MARK: - Mocks generated from file: CatDogTubeDomain/video/presentasion/collection/VideoCollectionContract.swift at 2017-08-17 02:06:14 +0000

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

class MockVideoCollectionContract_View: VideoCollectionContract_View, Cuckoo.Mock {
    typealias MocksType = VideoCollectionContract_View
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_View
    typealias Verification = __VerificationProxy_VideoCollectionContract_View
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: VideoCollectionContract_View?

    func spy(on victim: VideoCollectionContract_View) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func set(presenter: VideoCollectionContract_Presenter)  {
        
        return cuckoo_manager.call("set(presenter: VideoCollectionContract_Presenter)",
            parameters: (presenter),
            original: observed.map { o in
                return { (presenter: VideoCollectionContract_Presenter) in
                    o.set(presenter: presenter)
                }
            })
        
    }
    
    public func show(videos: [Video])  {
        
        return cuckoo_manager.call("show(videos: [Video])",
            parameters: (videos),
            original: observed.map { o in
                return { (videos: [Video]) in
                    o.show(videos: videos)
                }
            })
        
    }
    
    public func showErrorUI()  {
        
        return cuckoo_manager.call("showErrorUI()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.showErrorUI()
                }
            })
        
    }
    
    public func hideErrorUI()  {
        
        return cuckoo_manager.call("hideErrorUI()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.hideErrorUI()
                }
            })
        
    }
    
    public func showLoadingIndicator()  {
        
        return cuckoo_manager.call("showLoadingIndicator()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.showLoadingIndicator()
                }
            })
        
    }
    

    struct __StubbingProxy_VideoCollectionContract_View: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func set<M1: Cuckoo.Matchable>(presenter: M1) -> Cuckoo.StubNoReturnFunction<(VideoCollectionContract_Presenter)> where M1.MatchedType == VideoCollectionContract_Presenter {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_Presenter)>] = [wrap(matchable: presenter) { $0 }]
            return .init(stub: cuckoo_manager.createStub("set(presenter: VideoCollectionContract_Presenter)", parameterMatchers: matchers))
        }
        
        func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return .init(stub: cuckoo_manager.createStub("show(videos: [Video])", parameterMatchers: matchers))
        }
        
        func showErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("showErrorUI()", parameterMatchers: matchers))
        }
        
        func hideErrorUI() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("hideErrorUI()", parameterMatchers: matchers))
        }
        
        func showLoadingIndicator() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("showLoadingIndicator()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_VideoCollectionContract_View: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func set<M1: Cuckoo.Matchable>(presenter: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == VideoCollectionContract_Presenter {
            let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_Presenter)>] = [wrap(matchable: presenter) { $0 }]
            return cuckoo_manager.verify("set(presenter: VideoCollectionContract_Presenter)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return cuckoo_manager.verify("show(videos: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showErrorUI() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("showErrorUI()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func hideErrorUI() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("hideErrorUI()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("showLoadingIndicator()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class VideoCollectionContract_ViewStub: VideoCollectionContract_View {
    

    

    
    public func set(presenter: VideoCollectionContract_Presenter)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func show(videos: [Video])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showErrorUI()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func hideErrorUI()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showLoadingIndicator()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockVideoCollectionContract_Presenter: VideoCollectionContract_Presenter, Cuckoo.Mock {
    typealias MocksType = VideoCollectionContract_Presenter
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_Presenter
    typealias Verification = __VerificationProxy_VideoCollectionContract_Presenter
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: VideoCollectionContract_Presenter?

    func spy(on victim: VideoCollectionContract_Presenter) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func loadVideo(withFullScreenIndicator: Bool)  {
        
        return cuckoo_manager.call("loadVideo(withFullScreenIndicator: Bool)",
            parameters: (withFullScreenIndicator),
            original: observed.map { o in
                return { (withFullScreenIndicator: Bool) in
                    o.loadVideo(withFullScreenIndicator: withFullScreenIndicator)
                }
            })
        
    }
    
    public func onVideoTapped(_ video: Video)  {
        
        return cuckoo_manager.call("onVideoTapped(_: Video)",
            parameters: (video),
            original: observed.map { o in
                return { (video: Video) in
                    o.onVideoTapped(video)
                }
            })
        
    }
    
    public func markAsPrimal()  {
        
        return cuckoo_manager.call("markAsPrimal()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.markAsPrimal()
                }
            })
        
    }
    

    struct __StubbingProxy_VideoCollectionContract_Presenter: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return .init(stub: cuckoo_manager.createStub("loadVideo(withFullScreenIndicator: Bool)", parameterMatchers: matchers))
        }
        
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return .init(stub: cuckoo_manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
        
        func markAsPrimal() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("markAsPrimal()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_VideoCollectionContract_Presenter: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadVideo<M1: Cuckoo.Matchable>(withFullScreenIndicator: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: withFullScreenIndicator) { $0 }]
            return cuckoo_manager.verify("loadVideo(withFullScreenIndicator: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return cuckoo_manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func markAsPrimal() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("markAsPrimal()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class VideoCollectionContract_PresenterStub: VideoCollectionContract_Presenter {
    

    

    
    public func loadVideo(withFullScreenIndicator: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onVideoTapped(_ video: Video)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func markAsPrimal()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/TeamRepository.swift at 2017-08-17 02:06:14 +0000

//
//  TeamRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

class MockTeamDataSourceProtocol: TeamDataSourceProtocol, Cuckoo.Mock {
    typealias MocksType = TeamDataSourceProtocol
    typealias Stubbing = __StubbingProxy_TeamDataSourceProtocol
    typealias Verification = __VerificationProxy_TeamDataSourceProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: TeamDataSourceProtocol?

    func spy(on victim: TeamDataSourceProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func loadTeamName()  -> String? {
        
        return cuckoo_manager.call("loadTeamName() -> String?",
            parameters: (),
            original: observed.map { o in
                return { () -> String? in
                    o.loadTeamName()
                }
            })
        
    }
    
    public func save(teamName: String)  {
        
        return cuckoo_manager.call("save(teamName: String)",
            parameters: (teamName),
            original: observed.map { o in
                return { (teamName: String) in
                    o.save(teamName: teamName)
                }
            })
        
    }
    

    struct __StubbingProxy_TeamDataSourceProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadTeamName() -> Cuckoo.StubFunction<(), Optional<String>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("loadTeamName() -> String?", parameterMatchers: matchers))
        }
        
        func save<M1: Cuckoo.Matchable>(teamName: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: teamName) { $0 }]
            return .init(stub: cuckoo_manager.createStub("save(teamName: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_TeamDataSourceProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadTeamName() -> Cuckoo.__DoNotUse<Optional<String>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("loadTeamName() -> String?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(teamName: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: teamName) { $0 }]
            return cuckoo_manager.verify("save(teamName: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class TeamDataSourceProtocolStub: TeamDataSourceProtocol {
    

    

    
    public func loadTeamName()  -> String? {
        return DefaultValueRegistry.defaultValue(for: Optional<String>.self)
    }
    
    public func save(teamName: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockTeamRepository: TeamRepository, Cuckoo.Mock {
    typealias MocksType = TeamRepository
    typealias Stubbing = __StubbingProxy_TeamRepository
    typealias Verification = __VerificationProxy_TeamRepository
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: TeamRepository?

    func spy(on victim: TeamRepository) -> Self {
        observed = victim
        return self
    }

    

    

    
    public override func loadTeam()  -> Team? {
        
        return cuckoo_manager.call("loadTeam() -> Team?",
            parameters: (),
            original: observed.map { o in
                return { () -> Team? in
                    o.loadTeam()
                }
            })
        
    }
    
    public override func save(team: Team)  {
        
        return cuckoo_manager.call("save(team: Team)",
            parameters: (team),
            original: observed.map { o in
                return { (team: Team) in
                    o.save(team: team)
                }
            })
        
    }
    

    struct __StubbingProxy_TeamRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadTeam() -> Cuckoo.StubFunction<(), Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("loadTeam() -> Team?", parameterMatchers: matchers))
        }
        
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.StubNoReturnFunction<(Team)> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return .init(stub: cuckoo_manager.createStub("save(team: Team)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_TeamRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadTeam() -> Cuckoo.__DoNotUse<Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("loadTeam() -> Team?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return cuckoo_manager.verify("save(team: Team)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class TeamRepositoryStub: TeamRepository {
    

    

    
    public override func loadTeam()  -> Team? {
        return DefaultValueRegistry.defaultValue(for: Optional<Team>.self)
    }
    
    public override func save(team: Team)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/player/presentation/PlayerContract.swift at 2017-08-17 02:06:14 +0000

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

class MockPlayerContract_View: PlayerContract_View, Cuckoo.Mock {
    typealias MocksType = PlayerContract_View
    typealias Stubbing = __StubbingProxy_PlayerContract_View
    typealias Verification = __VerificationProxy_PlayerContract_View
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: PlayerContract_View?

    func spy(on victim: PlayerContract_View) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func loadPlayerView(with videoId: String)  -> Bool {
        
        return cuckoo_manager.call("loadPlayerView(with: String) -> Bool",
            parameters: (videoId),
            original: observed.map { o in
                return { (videoId: String) -> Bool in
                    o.loadPlayerView(with: videoId)
                }
            })
        
    }
    
    public func loadVideo(with videoId: String)  {
        
        return cuckoo_manager.call("loadVideo(with: String)",
            parameters: (videoId),
            original: observed.map { o in
                return { (videoId: String) in
                    o.loadVideo(with: videoId)
                }
            })
        
    }
    
    public func play()  {
        
        return cuckoo_manager.call("play()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.play()
                }
            })
        
    }
    
    public func pause()  {
        
        return cuckoo_manager.call("pause()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.pause()
                }
            })
        
    }
    
    public func showPlayer()  {
        
        return cuckoo_manager.call("showPlayer()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.showPlayer()
                }
            })
        
    }
    

    struct __StubbingProxy_PlayerContract_View: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubFunction<(String), Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("loadPlayerView(with: String) -> Bool", parameterMatchers: matchers))
        }
        
        func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return .init(stub: cuckoo_manager.createStub("loadVideo(with: String)", parameterMatchers: matchers))
        }
        
        func play() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("play()", parameterMatchers: matchers))
        }
        
        func pause() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("pause()", parameterMatchers: matchers))
        }
        
        func showPlayer() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("showPlayer()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_PlayerContract_View: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return cuckoo_manager.verify("loadPlayerView(with: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
            return cuckoo_manager.verify("loadVideo(with: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func play() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("play()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func pause() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("pause()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showPlayer() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("showPlayer()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class PlayerContract_ViewStub: PlayerContract_View {
    

    

    
    public func loadPlayerView(with videoId: String)  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
    public func loadVideo(with videoId: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func play()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func pause()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func showPlayer()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockPlayerContract_Presenter: PlayerContract_Presenter, Cuckoo.Mock {
    typealias MocksType = PlayerContract_Presenter
    typealias Stubbing = __StubbingProxy_PlayerContract_Presenter
    typealias Verification = __VerificationProxy_PlayerContract_Presenter
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: PlayerContract_Presenter?

    func spy(on victim: PlayerContract_Presenter) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func onVideoLoaded(_ videos: [Video])  {
        
        return cuckoo_manager.call("onVideoLoaded(_: [Video])",
            parameters: (videos),
            original: observed.map { o in
                return { (videos: [Video]) in
                    o.onVideoLoaded(videos)
                }
            })
        
    }
    
    public func onVideoTapped(_ video: Video)  {
        
        return cuckoo_manager.call("onVideoTapped(_: Video)",
            parameters: (video),
            original: observed.map { o in
                return { (video: Video) in
                    o.onVideoTapped(video)
                }
            })
        
    }
    

    struct __StubbingProxy_PlayerContract_Presenter: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.StubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return .init(stub: cuckoo_manager.createStub("onVideoLoaded(_: [Video])", parameterMatchers: matchers))
        }
        
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.StubNoReturnFunction<(Video)> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return .init(stub: cuckoo_manager.createStub("onVideoTapped(_: Video)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_PlayerContract_Presenter: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Video] {
            let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
            return cuckoo_manager.verify("onVideoLoaded(_: [Video])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
            let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
            return cuckoo_manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class PlayerContract_PresenterStub: PlayerContract_Presenter {
    

    

    
    public func onVideoLoaded(_ videos: [Video])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onVideoTapped(_ video: Video)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/Team.swift at 2017-08-17 02:06:14 +0000

//
//  Team.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

class MockTeam: Team, Cuckoo.Mock {
    typealias MocksType = Team
    typealias Stubbing = __StubbingProxy_Team
    typealias Verification = __VerificationProxy_Team
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: Team?

    func spy(on victim: Team) -> Self {
        observed = victim
        return self
    }

    

    

    
    public override func nameString()  -> String {
        
        return cuckoo_manager.call("nameString() -> String",
            parameters: (),
            original: observed.map { o in
                return { () -> String in
                    o.nameString()
                }
            })
        
    }
    
    public override func isDogTeam()  -> Bool {
        
        return cuckoo_manager.call("isDogTeam() -> Bool",
            parameters: (),
            original: observed.map { o in
                return { () -> Bool in
                    o.isDogTeam()
                }
            })
        
    }
    

    struct __StubbingProxy_Team: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func nameString() -> Cuckoo.StubFunction<(), String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("nameString() -> String", parameterMatchers: matchers))
        }
        
        func isDogTeam() -> Cuckoo.StubFunction<(), Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("isDogTeam() -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_Team: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func nameString() -> Cuckoo.__DoNotUse<String> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("nameString() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func isDogTeam() -> Cuckoo.__DoNotUse<Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("isDogTeam() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class TeamStub: Team {
    

    

    
    public override func nameString()  -> String {
        return DefaultValueRegistry.defaultValue(for: String.self)
    }
    
    public override func isDogTeam()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/LoadVideoUseCase.swift at 2017-08-17 02:06:14 +0000

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

class MockLoadVideoUseCase: LoadVideoUseCase, Cuckoo.Mock {
    typealias MocksType = LoadVideoUseCase
    typealias Stubbing = __StubbingProxy_LoadVideoUseCase
    typealias Verification = __VerificationProxy_LoadVideoUseCase
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: LoadVideoUseCase?

    func spy(on victim: LoadVideoUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void)  {
        
        return cuckoo_manager.call("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)",
            parameters: (completionHandler),
            original: observed.map { o in
                return { (completionHandler: @escaping (_ videos:[Video]?) -> Void) in
                    o.loadVideos(completionHandler)
                }
            })
        
    }
    

    struct __StubbingProxy_LoadVideoUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.StubNoReturnFunction<((_ videos:[Video]?) -> Void)> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return .init(stub: cuckoo_manager.createStub("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_LoadVideoUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadVideos<M1: Cuckoo.Matchable>(_ completionHandler: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (_ videos:[Video]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((_ videos:[Video]?) -> Void)>] = [wrap(matchable: completionHandler) { $0 }]
            return cuckoo_manager.verify("loadVideos(_: @escaping (_ videos:[Video]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class LoadVideoUseCaseStub: LoadVideoUseCase {
    

    

    
    public func loadVideos(_ completionHandler: @escaping (_ videos:[Video]?) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/video/presentasion/segmented/SegmentContract.swift at 2017-08-17 02:06:14 +0000

//
//  SegmentContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

class MockSegmentContract_View: SegmentContract_View, Cuckoo.Mock {
    typealias MocksType = SegmentContract_View
    typealias Stubbing = __StubbingProxy_SegmentContract_View
    typealias Verification = __VerificationProxy_SegmentContract_View
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SegmentContract_View?

    func spy(on victim: SegmentContract_View) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_SegmentContract_View: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_SegmentContract_View: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class SegmentContract_ViewStub: SegmentContract_View {
    

    

    
}



class MockSegmentContract_Presenter: SegmentContract_Presenter, Cuckoo.Mock {
    typealias MocksType = SegmentContract_Presenter
    typealias Stubbing = __StubbingProxy_SegmentContract_Presenter
    typealias Verification = __VerificationProxy_SegmentContract_Presenter
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SegmentContract_Presenter?

    func spy(on victim: SegmentContract_Presenter) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func markAsPrimal()  {
        
        return cuckoo_manager.call("markAsPrimal()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.markAsPrimal()
                }
            })
        
    }
    

    struct __StubbingProxy_SegmentContract_Presenter: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func markAsPrimal() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("markAsPrimal()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SegmentContract_Presenter: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func markAsPrimal() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("markAsPrimal()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SegmentContract_PresenterStub: SegmentContract_Presenter {
    

    

    
    public func markAsPrimal()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/TeamUseCase.swift at 2017-08-17 02:06:14 +0000

//
//  TeamUseCase.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTubeDomain

import Foundation

class MockTeamRepositoryProtocol: TeamRepositoryProtocol, Cuckoo.Mock {
    typealias MocksType = TeamRepositoryProtocol
    typealias Stubbing = __StubbingProxy_TeamRepositoryProtocol
    typealias Verification = __VerificationProxy_TeamRepositoryProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: TeamRepositoryProtocol?

    func spy(on victim: TeamRepositoryProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
    public func loadTeam()  -> Team? {
        
        return cuckoo_manager.call("loadTeam() -> Team?",
            parameters: (),
            original: observed.map { o in
                return { () -> Team? in
                    o.loadTeam()
                }
            })
        
    }
    
    public func save(team: Team)  {
        
        return cuckoo_manager.call("save(team: Team)",
            parameters: (team),
            original: observed.map { o in
                return { (team: Team) in
                    o.save(team: team)
                }
            })
        
    }
    

    struct __StubbingProxy_TeamRepositoryProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadTeam() -> Cuckoo.StubFunction<(), Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("loadTeam() -> Team?", parameterMatchers: matchers))
        }
        
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.StubNoReturnFunction<(Team)> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return .init(stub: cuckoo_manager.createStub("save(team: Team)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_TeamRepositoryProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadTeam() -> Cuckoo.__DoNotUse<Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("loadTeam() -> Team?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return cuckoo_manager.verify("save(team: Team)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class TeamRepositoryProtocolStub: TeamRepositoryProtocol {
    

    

    
    public func loadTeam()  -> Team? {
        return DefaultValueRegistry.defaultValue(for: Optional<Team>.self)
    }
    
    public func save(team: Team)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockTeamUseCase: TeamUseCase, Cuckoo.Mock {
    typealias MocksType = TeamUseCase
    typealias Stubbing = __StubbingProxy_TeamUseCase
    typealias Verification = __VerificationProxy_TeamUseCase
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: TeamUseCase?

    func spy(on victim: TeamUseCase) -> Self {
        observed = victim
        return self
    }

    

    

    
    public override func loadTeam()  -> Team? {
        
        return cuckoo_manager.call("loadTeam() -> Team?",
            parameters: (),
            original: observed.map { o in
                return { () -> Team? in
                    o.loadTeam()
                }
            })
        
    }
    
    public override func save(team: Team)  {
        
        return cuckoo_manager.call("save(team: Team)",
            parameters: (team),
            original: observed.map { o in
                return { (team: Team) in
                    o.save(team: team)
                }
            })
        
    }
    

    struct __StubbingProxy_TeamUseCase: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func loadTeam() -> Cuckoo.StubFunction<(), Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("loadTeam() -> Team?", parameterMatchers: matchers))
        }
        
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.StubNoReturnFunction<(Team)> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return .init(stub: cuckoo_manager.createStub("save(team: Team)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_TeamUseCase: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func loadTeam() -> Cuckoo.__DoNotUse<Optional<Team>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("loadTeam() -> Team?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Team {
            let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
            return cuckoo_manager.verify("save(team: Team)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class TeamUseCaseStub: TeamUseCase {
    

    

    
    public override func loadTeam()  -> Team? {
        return DefaultValueRegistry.defaultValue(for: Optional<Team>.self)
    }
    
    public override func save(team: Team)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/model/Video.swift at 2017-08-17 02:06:14 +0000

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

class MockVideo: Video, Cuckoo.Mock {
    typealias MocksType = Video
    typealias Stubbing = __StubbingProxy_Video
    typealias Verification = __VerificationProxy_Video
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: Video?

    func spy(on victim: Video) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "description", "accesibility": "public", "@type": "InstanceVariable", "type": "String", "isReadOnly": true]
     override var description: String {
        get {
            return cuckoo_manager.getter("description", original: observed.map { o in return { () -> String in o.description }})
        }
        
    }
    

    

    

    struct __StubbingProxy_Video: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var description: Cuckoo.ToBeStubbedReadOnlyProperty<String> {
            return .init(manager: cuckoo_manager, name: "description")
        }
        
        
    }


    struct __VerificationProxy_Video: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var description: Cuckoo.VerifyReadOnlyProperty<String> {
            return .init(manager: cuckoo_manager, name: "description", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
    }


}

 class VideoStub: Video {
    
     override var description: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
}




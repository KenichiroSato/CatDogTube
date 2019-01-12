// MARK: - Mocks generated from file: CatDogTubeDomain/player/presentation/PlayerContract.swift at 2019-01-12 03:11:20 +0000

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

class MockPlayerContract_View: PlayerContract_View, Cuckoo.ProtocolMock {
    typealias MocksType = PlayerContract_View
    typealias Stubbing = __StubbingProxy_PlayerContract_View
    typealias Verification = __VerificationProxy_PlayerContract_View

    private var __defaultImplStub: PlayerContract_View?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: PlayerContract_View) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadPlayerView", "returnSignature": " -> Bool", "fullyQualifiedName": "loadPlayerView(with: String) -> Bool", "parameterSignature": "with videoId: String", "parameterSignatureWithoutNames": "videoId: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "videoId", "call": "with: videoId", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("with"), name: "videoId", type: "String", range: CountableRange(391..<411), nameRange: CountableRange(391..<395))], "returnType": "Bool", "isOptional": false, "escapingParameterNames": "videoId", "stubFunction": "Cuckoo.ProtocolStubFunction"]
    public func loadPlayerView(with videoId: String)  -> Bool {
        
            return cuckoo_manager.call("loadPlayerView(with: String) -> Bool",
                parameters: (videoId),
                escapingParameters: (videoId),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadPlayerView(with: videoId))
        
    }
    
    // ["name": "loadVideo", "returnSignature": "", "fullyQualifiedName": "loadVideo(with: String)", "parameterSignature": "with videoId: String", "parameterSignatureWithoutNames": "videoId: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "videoId", "call": "with: videoId", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("with"), name: "videoId", type: "String", range: CountableRange(518..<538), nameRange: CountableRange(518..<522))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "videoId", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func loadVideo(with videoId: String)  {
        
            return cuckoo_manager.call("loadVideo(with: String)",
                parameters: (videoId),
                escapingParameters: (videoId),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadVideo(with: videoId))
        
    }
    
    // ["name": "play", "returnSignature": "", "fullyQualifiedName": "play()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func play()  {
        
            return cuckoo_manager.call("play()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.play())
        
    }
    
    // ["name": "pause", "returnSignature": "", "fullyQualifiedName": "pause()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func pause()  {
        
            return cuckoo_manager.call("pause()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.pause())
        
    }
    
    // ["name": "showPlayer", "returnSignature": "", "fullyQualifiedName": "showPlayer()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func showPlayer()  {
        
            return cuckoo_manager.call("showPlayer()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.showPlayer())
        
    }
    

	struct __StubbingProxy_PlayerContract_View: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadPlayerView<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.ProtocolStubFunction<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_View.self, method: "loadPlayerView(with: String) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func loadVideo<M1: Cuckoo.Matchable>(with videoId: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: videoId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_View.self, method: "loadVideo(with: String)", parameterMatchers: matchers))
	    }
	    
	    func play() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_View.self, method: "play()", parameterMatchers: matchers))
	    }
	    
	    func pause() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_View.self, method: "pause()", parameterMatchers: matchers))
	    }
	    
	    func showPlayer() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_View.self, method: "showPlayer()", parameterMatchers: matchers))
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


class MockPlayerContract_Presenter: PlayerContract_Presenter, Cuckoo.ProtocolMock {
    typealias MocksType = PlayerContract_Presenter
    typealias Stubbing = __StubbingProxy_PlayerContract_Presenter
    typealias Verification = __VerificationProxy_PlayerContract_Presenter

    private var __defaultImplStub: PlayerContract_Presenter?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: PlayerContract_Presenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "onVideoLoaded", "returnSignature": "", "fullyQualifiedName": "onVideoLoaded(_: [Video])", "parameterSignature": "_ videos: [Video]", "parameterSignatureWithoutNames": "videos: [Video]", "inputTypes": "[Video]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "videos", "call": "videos", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "videos", type: "[Video]", range: CountableRange(689..<706), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "videos", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func onVideoLoaded(_ videos: [Video])  {
        
            return cuckoo_manager.call("onVideoLoaded(_: [Video])",
                parameters: (videos),
                escapingParameters: (videos),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.onVideoLoaded(videos))
        
    }
    
    // ["name": "onVideoTapped", "returnSignature": "", "fullyQualifiedName": "onVideoTapped(_: Video)", "parameterSignature": "_ video: Video", "parameterSignatureWithoutNames": "video: Video", "inputTypes": "Video", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "video", "call": "video", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "video", type: "Video", range: CountableRange(736..<750), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "video", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func onVideoTapped(_ video: Video)  {
        
            return cuckoo_manager.call("onVideoTapped(_: Video)",
                parameters: (video),
                escapingParameters: (video),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.onVideoTapped(video))
        
    }
    

	struct __StubbingProxy_PlayerContract_Presenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onVideoLoaded<M1: Cuckoo.Matchable>(_ videos: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
	        let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_Presenter.self, method: "onVideoLoaded(_: [Video])", parameterMatchers: matchers))
	    }
	    
	    func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Video)> where M1.MatchedType == Video {
	        let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPlayerContract_Presenter.self, method: "onVideoTapped(_: Video)", parameterMatchers: matchers))
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


// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/Team.swift at 2019-01-12 03:11:20 +0000

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

class MockTeam: Team, Cuckoo.ClassMock {
    typealias MocksType = Team
    typealias Stubbing = __StubbingProxy_Team
    typealias Verification = __VerificationProxy_Team

    private var __defaultImplStub: Team?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: Team) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "nameString", "returnSignature": " -> String", "fullyQualifiedName": "nameString() -> String", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "String", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func nameString()  -> String {
        
            return cuckoo_manager.call("nameString() -> String",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.nameString()
                    ,
                defaultCall: __defaultImplStub!.nameString())
        
    }
    
    // ["name": "isDogTeam", "returnSignature": " -> Bool", "fullyQualifiedName": "isDogTeam() -> Bool", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Bool", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func isDogTeam()  -> Bool {
        
            return cuckoo_manager.call("isDogTeam() -> Bool",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.isDogTeam()
                    ,
                defaultCall: __defaultImplStub!.isDogTeam())
        
    }
    

	struct __StubbingProxy_Team: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func nameString() -> Cuckoo.ClassStubFunction<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeam.self, method: "nameString() -> String", parameterMatchers: matchers))
	    }
	    
	    func isDogTeam() -> Cuckoo.ClassStubFunction<(), Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeam.self, method: "isDogTeam() -> Bool", parameterMatchers: matchers))
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


// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/TeamRepository.swift at 2019-01-12 03:11:20 +0000

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

class MockTeamDataSourceProtocol: TeamDataSourceProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = TeamDataSourceProtocol
    typealias Stubbing = __StubbingProxy_TeamDataSourceProtocol
    typealias Verification = __VerificationProxy_TeamDataSourceProtocol

    private var __defaultImplStub: TeamDataSourceProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: TeamDataSourceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadTeamName", "returnSignature": " -> String?", "fullyQualifiedName": "loadTeamName() -> String?", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Optional<String>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
    public func loadTeamName()  -> String? {
        
            return cuckoo_manager.call("loadTeamName() -> String?",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadTeamName())
        
    }
    
    // ["name": "save", "returnSignature": "", "fullyQualifiedName": "save(teamName: String)", "parameterSignature": "teamName: String", "parameterSignatureWithoutNames": "teamName: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "teamName", "call": "teamName: teamName", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("teamName"), name: "teamName", type: "String", range: CountableRange(263..<278), nameRange: CountableRange(263..<271))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "teamName", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func save(teamName: String)  {
        
            return cuckoo_manager.call("save(teamName: String)",
                parameters: (teamName),
                escapingParameters: (teamName),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.save(teamName: teamName))
        
    }
    

	struct __StubbingProxy_TeamDataSourceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadTeamName() -> Cuckoo.ProtocolStubFunction<(), Optional<String>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamDataSourceProtocol.self, method: "loadTeamName() -> String?", parameterMatchers: matchers))
	    }
	    
	    func save<M1: Cuckoo.Matchable>(teamName: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: teamName) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamDataSourceProtocol.self, method: "save(teamName: String)", parameterMatchers: matchers))
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


class MockTeamRepository: TeamRepository, Cuckoo.ClassMock {
    typealias MocksType = TeamRepository
    typealias Stubbing = __StubbingProxy_TeamRepository
    typealias Verification = __VerificationProxy_TeamRepository

    private var __defaultImplStub: TeamRepository?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: TeamRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadTeam", "returnSignature": " -> Team?", "fullyQualifiedName": "loadTeam() -> Team?", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Optional<Team>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func loadTeam()  -> Team? {
        
            return cuckoo_manager.call("loadTeam() -> Team?",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.loadTeam()
                    ,
                defaultCall: __defaultImplStub!.loadTeam())
        
    }
    
    // ["name": "save", "returnSignature": "", "fullyQualifiedName": "save(team: Team)", "parameterSignature": "team: Team", "parameterSignatureWithoutNames": "team: Team", "inputTypes": "Team", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "team", "call": "team: team", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("team"), name: "team", type: "Team", range: CountableRange(693..<702), nameRange: CountableRange(693..<697))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "team", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
    public override func save(team: Team)  {
        
            return cuckoo_manager.call("save(team: Team)",
                parameters: (team),
                escapingParameters: (team),
                superclassCall:
                    
                    super.save(team: team)
                    ,
                defaultCall: __defaultImplStub!.save(team: team))
        
    }
    

	struct __StubbingProxy_TeamRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadTeam() -> Cuckoo.ClassStubFunction<(), Optional<Team>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamRepository.self, method: "loadTeam() -> Team?", parameterMatchers: matchers))
	    }
	    
	    func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.ClassStubNoReturnFunction<(Team)> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamRepository.self, method: "save(team: Team)", parameterMatchers: matchers))
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


// MARK: - Mocks generated from file: CatDogTubeDomain/setting/domain/TeamUseCase.swift at 2019-01-12 03:11:20 +0000

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

class MockTeamRepositoryProtocol: TeamRepositoryProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = TeamRepositoryProtocol
    typealias Stubbing = __StubbingProxy_TeamRepositoryProtocol
    typealias Verification = __VerificationProxy_TeamRepositoryProtocol

    private var __defaultImplStub: TeamRepositoryProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: TeamRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadTeam", "returnSignature": " -> Team?", "fullyQualifiedName": "loadTeam() -> Team?", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Optional<Team>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
    public func loadTeam()  -> Team? {
        
            return cuckoo_manager.call("loadTeam() -> Team?",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadTeam())
        
    }
    
    // ["name": "save", "returnSignature": "", "fullyQualifiedName": "save(team: Team)", "parameterSignature": "team: Team", "parameterSignatureWithoutNames": "team: Team", "inputTypes": "Team", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "team", "call": "team: team", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("team"), name: "team", type: "Team", range: CountableRange(254..<263), nameRange: CountableRange(254..<258))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "team", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func save(team: Team)  {
        
            return cuckoo_manager.call("save(team: Team)",
                parameters: (team),
                escapingParameters: (team),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.save(team: team))
        
    }
    

	struct __StubbingProxy_TeamRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadTeam() -> Cuckoo.ProtocolStubFunction<(), Optional<Team>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamRepositoryProtocol.self, method: "loadTeam() -> Team?", parameterMatchers: matchers))
	    }
	    
	    func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Team)> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamRepositoryProtocol.self, method: "save(team: Team)", parameterMatchers: matchers))
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


class MockTeamUseCase: TeamUseCase, Cuckoo.ClassMock {
    typealias MocksType = TeamUseCase
    typealias Stubbing = __StubbingProxy_TeamUseCase
    typealias Verification = __VerificationProxy_TeamUseCase

    private var __defaultImplStub: TeamUseCase?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: TeamUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadTeam", "returnSignature": " -> Team?", "fullyQualifiedName": "loadTeam() -> Team?", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Optional<Team>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubFunction"]
    public override func loadTeam()  -> Team? {
        
            return cuckoo_manager.call("loadTeam() -> Team?",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.loadTeam()
                    ,
                defaultCall: __defaultImplStub!.loadTeam())
        
    }
    
    // ["name": "save", "returnSignature": "", "fullyQualifiedName": "save(team: Team)", "parameterSignature": "team: Team", "parameterSignatureWithoutNames": "team: Team", "inputTypes": "Team", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "public", "parameterNames": "team", "call": "team: team", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("team"), name: "team", type: "Team", range: CountableRange(722..<731), nameRange: CountableRange(722..<726))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "team", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
    public override func save(team: Team)  {
        
            return cuckoo_manager.call("save(team: Team)",
                parameters: (team),
                escapingParameters: (team),
                superclassCall:
                    
                    super.save(team: team)
                    ,
                defaultCall: __defaultImplStub!.save(team: team))
        
    }
    

	struct __StubbingProxy_TeamUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadTeam() -> Cuckoo.ClassStubFunction<(), Optional<Team>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamUseCase.self, method: "loadTeam() -> Team?", parameterMatchers: matchers))
	    }
	    
	    func save<M1: Cuckoo.Matchable>(team: M1) -> Cuckoo.ClassStubNoReturnFunction<(Team)> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTeamUseCase.self, method: "save(team: Team)", parameterMatchers: matchers))
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


// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/LoadVideoUseCase.swift at 2019-01-12 03:11:20 +0000

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

class MockLoadVideoUseCase: LoadVideoUseCase, Cuckoo.ProtocolMock {
    typealias MocksType = LoadVideoUseCase
    typealias Stubbing = __StubbingProxy_LoadVideoUseCase
    typealias Verification = __VerificationProxy_LoadVideoUseCase

    private var __defaultImplStub: LoadVideoUseCase?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: LoadVideoUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadVideos", "returnSignature": "", "fullyQualifiedName": "loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)", "parameterSignature": "token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void", "parameterSignatureWithoutNames": "token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void", "inputTypes": "String?, (_ videos:[Video]?, _ token:String?) -> Void", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": true, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "token, completionHandler", "call": "token: token, completionHandler: completionHandler", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("token"), name: "token", type: "String?", range: CountableRange(226..<240), nameRange: CountableRange(226..<231)), CuckooGeneratorFramework.MethodParameter(label: Optional("completionHandler"), name: "completionHandler", type: "@escaping (_ videos:[Video]?, _ token:String?) -> Void", range: CountableRange(262..<335), nameRange: CountableRange(262..<279))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "token, completionHandler", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)  {
        
            return cuckoo_manager.call("loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)",
                parameters: (token, completionHandler),
                escapingParameters: (token, completionHandler),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadVideos(token: token, completionHandler: completionHandler))
        
    }
    

	struct __StubbingProxy_LoadVideoUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadVideos<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(token: M1, completionHandler: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String?, (_ videos:[Video]?, _ token:String?) -> Void)> where M1.MatchedType == String?, M2.MatchedType == (_ videos:[Video]?, _ token:String?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (_ videos:[Video]?, _ token:String?) -> Void)>] = [wrap(matchable: token) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLoadVideoUseCase.self, method: "loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)", parameterMatchers: matchers))
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
	    func loadVideos<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(token: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String?, M2.MatchedType == (_ videos:[Video]?, _ token:String?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (_ videos:[Video]?, _ token:String?) -> Void)>] = [wrap(matchable: token) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
	        return cuckoo_manager.verify("loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class LoadVideoUseCaseStub: LoadVideoUseCase {
    

    

    
    public func loadVideos(token: String?, completionHandler: @escaping (_ videos:[Video]?, _ token:String?) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: CatDogTubeDomain/video/domain/model/Video.swift at 2019-01-12 03:11:20 +0000

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

class MockVideo: Video, Cuckoo.ClassMock {
    typealias MocksType = Video
    typealias Stubbing = __StubbingProxy_Video
    typealias Verification = __VerificationProxy_Video

    private var __defaultImplStub: Video?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: Video) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
    public override var description: String {
        get {
            return cuckoo_manager.getter("description",
                superclassCall:
                    
                    super.description
                    ,
                defaultCall: __defaultImplStub!.description)
        }
        
    }
    

    

    

	struct __StubbingProxy_Video: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var description: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockVideo, String> {
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
    
    public override var description: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: CatDogTubeDomain/video/presentasion/collection/VideoCollectionContract.swift at 2019-01-12 03:11:20 +0000

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

class MockVideoCollectionContract_View: VideoCollectionContract_View, Cuckoo.ProtocolMock {
    typealias MocksType = VideoCollectionContract_View
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_View
    typealias Verification = __VerificationProxy_VideoCollectionContract_View

    private var __defaultImplStub: VideoCollectionContract_View?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: VideoCollectionContract_View) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "set", "returnSignature": "", "fullyQualifiedName": "set(presenter: VideoCollectionContract_Presenter)", "parameterSignature": "presenter: VideoCollectionContract_Presenter", "parameterSignatureWithoutNames": "presenter: VideoCollectionContract_Presenter", "inputTypes": "VideoCollectionContract_Presenter", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "presenter", "call": "presenter: presenter", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("presenter"), name: "presenter", type: "VideoCollectionContract_Presenter", range: CountableRange(269..<313), nameRange: CountableRange(269..<278))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "presenter", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func set(presenter: VideoCollectionContract_Presenter)  {
        
            return cuckoo_manager.call("set(presenter: VideoCollectionContract_Presenter)",
                parameters: (presenter),
                escapingParameters: (presenter),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.set(presenter: presenter))
        
    }
    
    // ["name": "show", "returnSignature": "", "fullyQualifiedName": "show(videos: [Video])", "parameterSignature": "videos: [Video]", "parameterSignatureWithoutNames": "videos: [Video]", "inputTypes": "[Video]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "videos", "call": "videos: videos", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("videos"), name: "videos", type: "[Video]", range: CountableRange(334..<348), nameRange: CountableRange(334..<340))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "videos", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func show(videos: [Video])  {
        
            return cuckoo_manager.call("show(videos: [Video])",
                parameters: (videos),
                escapingParameters: (videos),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.show(videos: videos))
        
    }
    
    // ["name": "showErrorUI", "returnSignature": "", "fullyQualifiedName": "showErrorUI()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func showErrorUI()  {
        
            return cuckoo_manager.call("showErrorUI()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.showErrorUI())
        
    }
    
    // ["name": "hideErrorUI", "returnSignature": "", "fullyQualifiedName": "hideErrorUI()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func hideErrorUI()  {
        
            return cuckoo_manager.call("hideErrorUI()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.hideErrorUI())
        
    }
    
    // ["name": "showLoadingIndicator", "returnSignature": "", "fullyQualifiedName": "showLoadingIndicator()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func showLoadingIndicator()  {
        
            return cuckoo_manager.call("showLoadingIndicator()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.showLoadingIndicator())
        
    }
    

	struct __StubbingProxy_VideoCollectionContract_View: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func set<M1: Cuckoo.Matchable>(presenter: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(VideoCollectionContract_Presenter)> where M1.MatchedType == VideoCollectionContract_Presenter {
	        let matchers: [Cuckoo.ParameterMatcher<(VideoCollectionContract_Presenter)>] = [wrap(matchable: presenter) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_View.self, method: "set(presenter: VideoCollectionContract_Presenter)", parameterMatchers: matchers))
	    }
	    
	    func show<M1: Cuckoo.Matchable>(videos: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([Video])> where M1.MatchedType == [Video] {
	        let matchers: [Cuckoo.ParameterMatcher<([Video])>] = [wrap(matchable: videos) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_View.self, method: "show(videos: [Video])", parameterMatchers: matchers))
	    }
	    
	    func showErrorUI() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_View.self, method: "showErrorUI()", parameterMatchers: matchers))
	    }
	    
	    func hideErrorUI() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_View.self, method: "hideErrorUI()", parameterMatchers: matchers))
	    }
	    
	    func showLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_View.self, method: "showLoadingIndicator()", parameterMatchers: matchers))
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


class MockVideoCollectionContract_Presenter: VideoCollectionContract_Presenter, Cuckoo.ProtocolMock {
    typealias MocksType = VideoCollectionContract_Presenter
    typealias Stubbing = __StubbingProxy_VideoCollectionContract_Presenter
    typealias Verification = __VerificationProxy_VideoCollectionContract_Presenter

    private var __defaultImplStub: VideoCollectionContract_Presenter?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: VideoCollectionContract_Presenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "loadVideo", "returnSignature": "", "fullyQualifiedName": "loadVideo()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func loadVideo()  {
        
            return cuckoo_manager.call("loadVideo()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loadVideo())
        
    }
    
    // ["name": "onVideoTapped", "returnSignature": "", "fullyQualifiedName": "onVideoTapped(_: Video)", "parameterSignature": "_ video: Video", "parameterSignatureWithoutNames": "video: Video", "inputTypes": "Video", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "video", "call": "video", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "video", type: "Video", range: CountableRange(580..<594), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "video", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func onVideoTapped(_ video: Video)  {
        
            return cuckoo_manager.call("onVideoTapped(_: Video)",
                parameters: (video),
                escapingParameters: (video),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.onVideoTapped(video))
        
    }
    
    // ["name": "refreshVideos", "returnSignature": "", "fullyQualifiedName": "refreshVideos()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func refreshVideos()  {
        
            return cuckoo_manager.call("refreshVideos()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.refreshVideos())
        
    }
    
    // ["name": "onScrolled", "returnSignature": "", "fullyQualifiedName": "onScrolled(visiblePosition: Int)", "parameterSignature": "visiblePosition: Int", "parameterSignatureWithoutNames": "visiblePosition: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "visiblePosition", "call": "visiblePosition: visiblePosition", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("visiblePosition"), name: "visiblePosition", type: "Int", range: CountableRange(651..<671), nameRange: CountableRange(651..<666))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "visiblePosition", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func onScrolled(visiblePosition: Int)  {
        
            return cuckoo_manager.call("onScrolled(visiblePosition: Int)",
                parameters: (visiblePosition),
                escapingParameters: (visiblePosition),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.onScrolled(visiblePosition: visiblePosition))
        
    }
    
    // ["name": "markAsPrimal", "returnSignature": "", "fullyQualifiedName": "markAsPrimal()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func markAsPrimal()  {
        
            return cuckoo_manager.call("markAsPrimal()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.markAsPrimal())
        
    }
    

	struct __StubbingProxy_VideoCollectionContract_Presenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadVideo() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_Presenter.self, method: "loadVideo()", parameterMatchers: matchers))
	    }
	    
	    func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Video)> where M1.MatchedType == Video {
	        let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_Presenter.self, method: "onVideoTapped(_: Video)", parameterMatchers: matchers))
	    }
	    
	    func refreshVideos() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_Presenter.self, method: "refreshVideos()", parameterMatchers: matchers))
	    }
	    
	    func onScrolled<M1: Cuckoo.Matchable>(visiblePosition: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: visiblePosition) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_Presenter.self, method: "onScrolled(visiblePosition: Int)", parameterMatchers: matchers))
	    }
	    
	    func markAsPrimal() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockVideoCollectionContract_Presenter.self, method: "markAsPrimal()", parameterMatchers: matchers))
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
	    func loadVideo() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("loadVideo()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func onVideoTapped<M1: Cuckoo.Matchable>(_ video: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Video {
	        let matchers: [Cuckoo.ParameterMatcher<(Video)>] = [wrap(matchable: video) { $0 }]
	        return cuckoo_manager.verify("onVideoTapped(_: Video)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func refreshVideos() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("refreshVideos()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func onScrolled<M1: Cuckoo.Matchable>(visiblePosition: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: visiblePosition) { $0 }]
	        return cuckoo_manager.verify("onScrolled(visiblePosition: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func markAsPrimal() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("markAsPrimal()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class VideoCollectionContract_PresenterStub: VideoCollectionContract_Presenter {
    

    

    
    public func loadVideo()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onVideoTapped(_ video: Video)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func refreshVideos()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func onScrolled(visiblePosition: Int)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    public func markAsPrimal()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: CatDogTubeDomain/video/presentasion/segmented/SegmentContract.swift at 2019-01-12 03:11:20 +0000

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

class MockSegmentContract_View: SegmentContract_View, Cuckoo.ProtocolMock {
    typealias MocksType = SegmentContract_View
    typealias Stubbing = __StubbingProxy_SegmentContract_View
    typealias Verification = __VerificationProxy_SegmentContract_View

    private var __defaultImplStub: SegmentContract_View?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: SegmentContract_View) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
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


class MockSegmentContract_Presenter: SegmentContract_Presenter, Cuckoo.ProtocolMock {
    typealias MocksType = SegmentContract_Presenter
    typealias Stubbing = __StubbingProxy_SegmentContract_Presenter
    typealias Verification = __VerificationProxy_SegmentContract_Presenter

    private var __defaultImplStub: SegmentContract_Presenter?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: SegmentContract_Presenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "markAsPrimal", "returnSignature": "", "fullyQualifiedName": "markAsPrimal()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "public", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
    public func markAsPrimal()  {
        
            return cuckoo_manager.call("markAsPrimal()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.markAsPrimal())
        
    }
    

	struct __StubbingProxy_SegmentContract_Presenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func markAsPrimal() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSegmentContract_Presenter.self, method: "markAsPrimal()", parameterMatchers: matchers))
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


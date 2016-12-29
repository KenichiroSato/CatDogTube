// MARK: - Mocks generated from file: CatDogTube/Team.swift at 2016-12-29 03:50:00 +0000

//
//  Team.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/19.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Cuckoo
@testable import CatDogTube

import CatDogTubeDomain
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

// MARK: - Mocks generated from file: CatDogTube/TeamRepository.swift at 2016-12-29 03:50:00 +0000

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

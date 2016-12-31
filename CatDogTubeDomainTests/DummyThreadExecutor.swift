//
//  DummyThreadExecutor.swift
//  CatDogTube
//
//  Created by Kenichiro on 2016/12/04.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
@testable import CatDogTubeDomain

/**
 This class is used to avoid using background thread in Unit Test.
 All block is executed on called thread.
 */
class DummyThreadExecutor: ThreadExecutorProtocol {
 
    func runOnMain(_ block:@escaping () -> ()) {
        block()
    }
    
    func runOnBackground(_ block:@escaping () -> ()) {
        block()
    }

}

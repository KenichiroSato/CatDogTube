//
//  ThreadExecutor.swift
//  CatDogTube
//
//  Created by Kenichito Sato on 2016/12/04.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

class ThreadExecutor: ThreadExecutorProtocol {
    
    func runOnMain(_ block:@escaping () -> ()) {
        DispatchQueue.main.async {
            block()
        }
    }
    
    func runOnBackground(_ block:@escaping () -> ()) {
        DispatchQueue.global(qos: .default).async {
            block()
        }
    }

}

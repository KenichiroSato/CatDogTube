//
//  NSThread+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/04.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

extension Thread {
    
    class public func dispatchAsyncMain(_ block: @escaping () -> ()) {
        DispatchQueue.main.async(execute: block)
    }
    
    class public func dispatchAsyncGlobal(_ block: @escaping () -> ()) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
}

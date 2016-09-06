//
//  NSThread+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/04.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

extension Thread {
    
    class func dispatchAsyncMain(_ block: @escaping () -> ()) {
        DispatchQueue.main.async(execute: block)
    }
    
    class func dispatchAsyncGlobal(_ block: @escaping () -> ()) {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: block)
    }
    
}

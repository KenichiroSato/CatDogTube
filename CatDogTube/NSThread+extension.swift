//
//  NSThread+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/04.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

extension NSThread {
    
    class func dispatchAsyncMain(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    class func dispatchAsyncGlobal(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
}
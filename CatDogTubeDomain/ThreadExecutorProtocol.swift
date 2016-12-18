//
//  ThreadManagerProtocol.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/12/04.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

protocol ThreadExecutorProtocol {
    
    func runOnMain(_ block:@escaping () -> ())
    
    func runOnBackground(_ block:@escaping () -> ())

}

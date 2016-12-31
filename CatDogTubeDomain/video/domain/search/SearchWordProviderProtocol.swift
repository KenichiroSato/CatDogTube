//
//  SerchWordProvider.swift
//  CatDogTube
//
//  Created by ken on 2016/12/17.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

public protocol SearchWordProviderProtocol {
    func searchWord(for content:ContentType) -> String
}

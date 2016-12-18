//
//  SearchWordProvider.swift
//  CatDogTube
//
//  Created by ken on 2016/12/17.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

class SearchWordProvider: SearchWordProviderProtocol {
    
    func searchWord(for content: ContentType) -> String {
        switch content {
        case .cat:
            return Text.SEARCH_WORD_CAT
        case .dog:
            return Text.SEARCH_WORD_DOG
        }
    }
}

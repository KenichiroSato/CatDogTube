//
//  ContentType.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

enum ContentType {
    
    case CAT, DOG
    
    func iconName() -> String {
        switch self {
        case .CAT:
            return "cat"
        case .DOG:
            return "dog"
        }
    }
    
    func searchWord() -> String {
        switch self {
        case .CAT:
            return Text.SEARCH_WORD_CAT
        case .DOG:
            return Text.SEARCH_WORD_DOG
        }
    }
}
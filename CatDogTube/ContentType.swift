//
//  ContentType.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/16.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

enum ContentType : Int16 {
    
    case cat, dog
    
    func iconName() -> String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
    
    func keyword() -> String {
        switch self {
        case .cat:
            return Text.SEARCH_WORD_CAT
        case .dog:
            return Text.SEARCH_WORD_DOG
        }
    }
}

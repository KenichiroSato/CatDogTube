//
//  NSDate+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

extension NSDate {
    
    /**
     return String formatted in RFC3339 yyyy-MM-dd'T'HH:mm:ss'Z'
     - returns: formatted String
     */
    func RFC3339String() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return formatter.stringFromDate(self)
    }
    
    /**
     return NSDate which is XX days before self date.
     - parameter days: the UInt days. return value is calculated by this parameter.
     - returns: days ago date.
     */
    func daysAgo(days:UInt) -> NSDate {
        let timeInterval = self.timeIntervalSince1970
        let daysInSec = Double(days * 24 * 60 * 60)
        let newInterval = timeInterval - daysInSec
        return NSDate(timeIntervalSince1970: newInterval)
    }
}
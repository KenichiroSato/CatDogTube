//
//  NSDate+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/13.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     return String formatted in RFC3339 yyyy-MM-dd'T'HH:mm:ss'Z'
     - returns: formatted String
     */
    public func RFC3339String() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        return formatter.string(from: self)
    }
    
    /**
     return NSDate which is XX days before self date.
     - parameter days: the UInt days. return value is calculated by this parameter.
     - returns: days ago date.
     */
    public func daysAgo(_ days:UInt) -> Date {
        let timeInterval = self.timeIntervalSince1970
        let daysInSec = Double(days * 24 * 60 * 60)
        let newInterval = timeInterval - daysInSec
        return Date(timeIntervalSince1970: newInterval)
    }
}

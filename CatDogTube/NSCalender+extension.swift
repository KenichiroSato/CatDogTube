//
//  NSCalender+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//


import Foundation

extension Calendar {
    
    func dateWithYear(_ year:Int, Month:Int, Day:Int) -> Date? {
        return (self as NSCalendar).date(era: 1, year: year, month: Month, day: Day, hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
    
    /**
     - returns: NSDateComponents which includes only year, month, day, hour, minute, second
     */
    func components(_ date:Date) -> DateComponents {
        return dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    }
    
    /**
     generate the random date between maxDate and minDate.
     - returns: random date between maxDate and minDate
     */
    func randomDate(_ maxDate:Date, minDate:Date) -> Date {
        let maxTimeInterval = maxDate.timeIntervalSince1970
        let minTimeInterval = minDate.timeIntervalSince1970
        
        let randTimeInterval = minMaxDesignation(min: minTimeInterval, max: maxTimeInterval)
        return Date(timeIntervalSince1970: randTimeInterval)
    }
    
    fileprivate func minMaxDesignation(min: Double, max: Double) -> Double {
        if min < max {
            let diff = max - min + 1
            let random : Double = Double(arc4random_uniform(UInt32(diff)))
            return random + min
        }else {
            return max
        }
    }
}

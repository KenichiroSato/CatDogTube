//
//  NSCalender+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/13.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//


import Foundation

extension NSCalendar {
    
    func dateWithYear(year:Int, Month:Int, Day:Int) -> NSDate? {
        return self.dateWithEra(1, year: year, month: Month, day: Day, hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
    
    /**
     - returns: NSDateComponents which includes only year, month, day, hour, minute, second
     */
    func components(date:NSDate) -> NSDateComponents {
        return self.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day,
            NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: date)
    }
    
    /**
     generate the random date between maxDate and minDate.
     - returns: random date between maxDate and minDate
     */
    func randomDate(maxDate:NSDate, minDate:NSDate) -> NSDate {
        let maxTimeInterval = maxDate.timeIntervalSince1970
        let minTimeInterval = minDate.timeIntervalSince1970
        
        let randTimeInterval = minMaxDesignation(min: minTimeInterval, max: maxTimeInterval)
        return NSDate(timeIntervalSince1970: randTimeInterval)
    }
    
    private func minMaxDesignation(min min: Double, max: Double) -> Double {
        if min < max {
            let diff = max - min + 1
            let random : Double = Double(arc4random_uniform(UInt32(diff)))
            return random + min
        }else {
            return max
        }
    }
}
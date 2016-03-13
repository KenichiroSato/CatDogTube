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
     - returns: NSDateComponents which includes only year, month and day
     */
    func simpleComponents(date:NSDate) -> NSDateComponents {
        return self.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: date)
    }
    
    /**
     generate the random date between maxDate and minDate.
     IMPORTANT: this method ignores hour, min, sec information in arguments.
     IMPORTANT: probability of day29, 30, 31 is significantly low.
     - returns: random date between maxDate and minDate
     */
    func randomDate(maxDate:NSDate, minDate:NSDate) -> NSDate? {
        let max = self.simpleComponents(maxDate)
        let min = self.simpleComponents(minDate)
        
        let year = minMaxDesignation(min: min.year, max: max.year)
        let maxMonth = (year == max.year) ? max.month : 12
        let minMonth = (year == min.year) ? min.month : 1
        let month = minMaxDesignation(min: minMonth, max: maxMonth)
        let maxDay = (year == max.year && month == max.month) ? max.day : 28//because of February
        let minDay = (year == min.year && month == min.month) ? min.day : 1
        let day = minMaxDesignation(min: minDay, max: maxDay)
        return self.dateWithYear(year, Month: month, Day: day)
    }
    
    /**
     generate the date which is 1 month before the argument date.
     - parameter date: original date. return value is calclated based on this date.
     - returns: NSdate which is 1 month before the argument
     */
     func oneMonthAgo(date:NSDate) -> NSDate? {
        let now = self.simpleComponents(date)
        
        var year, month : Int
        if (now.month == 1) {
            year =  now.year - 1
            month = 12
        } else {
            year = now.year
            month = now.month - 1
        }
        return dateWithYear(year, Month: month, Day: now.day)
     }
    
    private func minMaxDesignation(min min: Int, max: Int) -> Int {
        if min < max {
            let diff = max - min + 1
            let random : Int = Int(arc4random_uniform(UInt32(diff)))
            return random + min
        }else {
            return max
        }
    }
    
}
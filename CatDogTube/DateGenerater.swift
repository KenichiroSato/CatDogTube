//
//  DateGenerater.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/12.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class DateGenerater: NSObject {

    static let BOTTOM_YEAR = 2011
    
    private let CURRENT_YEAR : Int
    private let MIN_YEAR : Int
    private let CURRENT_MONTH : Int
    
    init(currentYear:Int, minYear:Int, currentMonth:Int) {
        CURRENT_YEAR = (currentYear > minYear) ? currentYear : minYear
        MIN_YEAR = (currentYear > minYear) ? minYear : currentYear
        CURRENT_MONTH = (currentMonth < 1) ? 1 : (currentMonth > 12) ? 12 : currentMonth
        super.init()
    }
    
    class func currentDate() -> NSDateComponents {
        let date = NSDate()
        let cal = NSCalendar.currentCalendar()
        let comp = cal.components(
            [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day,
                NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second],
            fromDate: date)
        return comp
    }
    
    func generateDetaPair() -> (String, String) {
        let endTime: (year:Int, month:Int) = randomYearMonth()
        let startTime = previousYearMonth(endTime.year, month:endTime.month)
        let endString = generateDateString(endTime.year, month: endTime.month)
        let startString = generateDateString(startTime.year, month: startTime.month)
        return (endString, startString)
    }
    
    //returns String of RFC 3339 formatted date. e.x. "2010-04-01T00:00:00Z"
    private func generateDateString(year:Int, month:Int) -> String {
        let yearString = String(year)
        let monthString = month < 10 ? "0" + String(month) : String(month)
        return yearString + "-" + monthString + "-01T00:00:00Z"
    }
    
    private func randomYearMonth() -> (year:Int, month:Int) {
        let year = minMaxDesignation(min: MIN_YEAR, max: CURRENT_YEAR)
        let maxMonth = (year == CURRENT_YEAR) ? CURRENT_MONTH : 12
        let month = minMaxDesignation(min: 1, max: maxMonth)
        return (year, month)
    }
    
    private func minMaxDesignation(min _min: Int, max _max: Int) -> Int {
        if _min < _max {
            let diff = _max - _min + 1
            let random : Int = Int(arc4random_uniform(UInt32(diff)))
            return random + _min
        }else {
            return _max
        }
    }
    
    private func previousYearMonth(year:Int, month:Int) -> (year:Int, month:Int) {
        if (month == 1) {
            return (year - 1, 12)
        } else {
            return (year, month - 1)
        }
    }
    
}

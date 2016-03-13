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
    static let MAXIMUM_DAY = 28 // bacause of February
    
    private let currentYear : Int
    private let bottomYear : Int
    private let currentMonth : Int
    private let currentDay : Int
    
    init(currentDate:NSDateComponents, minYear:Int) {
        currentYear = (currentDate.year > minYear) ? currentDate.year : minYear
        bottomYear = (currentDate.year > minYear) ? minYear : currentDate.year
        currentMonth = currentDate.month
        currentDay = currentDate.day
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
    
    /**
     generate String pair of RFC 3339 formatted date String (end, start).
     end date does not exceed the currentDate which is given in constructor.
     start date is 1 month before the end date.
     - returns: Tuple value of (end, start) date String.
     */
    func generateDetaPair() -> (String, String) {
        let endTime: (year:Int, month:Int, day:Int) = randomDate()
        let startTime = oneMonthAgo(endTime)
        let endString = generateDateString(endTime)
        let startString = generateDateString(startTime)
        return (endString, startString)
    }
    
    /**
     Generate RFC 3339 formatted String (e.x. "2010-04-01T00:00:00Z")
     - parameter date:Tuple value of (year, month, date) which you want to covert to String
     - returns: String of RFC 3339 formatted date. e.x. "2010-04-01T00:00:00Z"
     */
    private func generateDateString(date:(year:Int, month:Int, day:Int)) -> String {
        let yearString = String(date.year)
        let monthString = date.month < 10 ? "0" + String(date.month) : String(date.month)
        let dayString = date.day < 10 ? "0" + String(date.day) : String(date.day)
        return yearString + "-" + monthString + "-" + dayString + "T00:00:00Z"
    }
    
    private func randomDate() -> (year:Int, month:Int, day:Int) {
        let year = minMaxDesignation(min: bottomYear, max: currentYear)
        let maxMonth = (year == currentYear) ? currentMonth : 12
        let month = minMaxDesignation(min: 1, max: maxMonth)
        let maxDay = (year == currentYear && month == currentMonth)
            ? currentDay : DateGenerater.MAXIMUM_DAY
        let day = minMaxDesignation(min: 1, max: maxDay)
        return (year, month, day)
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
    
    private func oneMonthAgo(date:(year:Int, month:Int, day:Int)) -> (year:Int, month:Int, day:Int) {
        if (date.month == 1) {
            return (date.year - 1, 12, date.day)
        } else {
            return (date.year, date.month - 1, date.day)
        }
    }
    
}

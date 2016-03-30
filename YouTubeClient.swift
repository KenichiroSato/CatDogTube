//
//  YouTubeClient.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation

class YouTubeClient: NSObject {

    private let baseUrl = "https://www.googleapis.com/youtube/v3/search"
    
    private let oldest:(year:Int, month:Int, day:Int) = (2011, 1, 1)
    private let SEARCH_PERIOD_DAYS: UInt = 30
    
    private let initialSearchParams = [
        "key" : "AIzaSyC1jZ8NyoZ_td6agdjK8kZRuAU5wjTSET0",
        "part" : "snippet",
        "type" : "video",
        "videoDuration" : "short",
        "maxResults" : "30",
        "order" : "viewCount"
    ]
    
    private func generateParams(searchWord:String) -> [String:String]{
        var params = initialSearchParams
        params["q"] = searchWord

        let publishedDate = generatePublishedParam()
        if let before = publishedDate.before,
            let after = publishedDate.after{
            params["publishedBefore"] = before
            params["publishedAfter"] = after
            print("before:" + before + " after:" + after)
        }
        
        return params
    }
    
    private func generatePublishedParam() -> (before:String?, after:String?) {
        let cal = NSCalendar.currentCalendar()
        let today = NSDate()
        guard let minDate = cal.dateWithYear(oldest.year, Month: oldest.month, Day: oldest.day)
        else {
            return (nil, nil)
        }
        let publishedBefore = cal.randomDate(today, minDate: minDate)
        let publishedAfter = publishedBefore.daysAgo(SEARCH_PERIOD_DAYS)
        return (publishedBefore.RFC3339String(), publishedAfter.RFC3339String())
    }
    
    func getVideos(searchWord:String, completionHandler: (videos:[Video]?) -> Void) {

        guard !searchWord.isEmpty else {
            completionHandler(videos: nil)
            return
        }
        
        let searchParams = generateParams(searchWord)
        guard let requestUrl = Http.generateRequestURL(baseUrl, queries: searchParams) else {
            completionHandler(videos: nil)
            return
        }
        
        performGetRequest(requestUrl, completion: {(data, response, error) in
            guard let code = (response as? NSHTTPURLResponse)?.statusCode
                where code == Http.StatusCode.OK.rawValue,
                let nonNilData = data else {
                    completionHandler(videos: nil)
                    return
            }
            let videos = YouTubeDataParser.parseResponse(nonNilData)
            completionHandler(videos: videos)
        })
    }
    
    private func performGetRequest(targetURL: NSURL, completion: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: targetURL)
        request.HTTPMethod = Http.Method.GET.rawValue
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfiguration)
        let task = session.dataTaskWithRequest(request, completionHandler:completion)
        task.resume()
    }
    
}

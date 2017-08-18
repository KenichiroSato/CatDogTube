//
//  YouTubeDataStore.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/03/27.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation
import CatDogTubeDomain

class YouTubeDataSource: NSObject, SearchVideoDataSourceProtocol {

    private let baseUrl = "https://www.googleapis.com/youtube/v3/search"
    
    private let oldest:(year:Int, month:Int, day:Int) = (2011, 1, 1)
    private let SEARCH_PERIOD_DAYS: UInt = 30
    
    private let initialSearchParams = [
        "key" : "replace key",
        "part" : "snippet",
        "type" : "video",
        "videoDuration" : "short",
        "maxResults" : "30",
        "order" : "viewCount"
    ]
    
    private func generateParams(with searchWord:String) -> [String:String]{
        var params = initialSearchParams
        params["q"] = searchWord
        
        let publishedDate = generatePublishedParam()
        if let before = publishedDate.before,
            let after = publishedDate.after{
            params["publishedBefore"] = before
            params["publishedAfter"] = after
            //cat
            //params["publishedBefore"] = "2015-03-13T15:00:26Z"//2014-02-18T17:30:05Z
            //params["publishedAfter"] =  "2015-02-11T15:00:26Z"//2014-01-19T17:30:05Z
            
            //dog
            //params["publishedBefore"] = "2013-08-12T18:01:59Z"//"2012-09-04T05:47:54Z"
            //params["publishedAfter"] =  "2013-07-13T18:01:59Z"//"2012-08-05T05:47:54Z"
            

            print("before:" + before + " after:" + after)
        }
        
        return params
    }
    
    private func generatePublishedParam() -> (before:String?, after:String?) {
        let cal = NSCalendar.current
        let today = Date()
        guard let minDate = cal.dateWithYear(oldest.year, Month: oldest.month, Day: oldest.day)
            else {
                return (nil, nil)
        }
        let publishedBefore = cal.randomDate(between:today, and: minDate)
        let publishedAfter = publishedBefore.daysAgo(SEARCH_PERIOD_DAYS)
        return (publishedBefore.RFC3339String(), publishedAfter.RFC3339String())
    }

    public func searchVideos(_ searchWord: String,
                             token: String?,
                             completionHandler: @escaping ([YouTubeVideo]?, String?) -> Void) {

        guard !searchWord.isEmpty else {
            completionHandler(nil, nil)
            return
        }
        
        let searchParams = generateParams(with:searchWord)
        guard let requestUrl = Http.generateRequestURL(baseUrl, queries: searchParams) else {
            completionHandler(nil, nil)
            return
        }
        
        performGetRequest(requestUrl, completion: {(data, response, error) in
            guard let code = (response as? HTTPURLResponse)?.statusCode
                , code == Http.StatusCode.ok.rawValue,
                let nonNilData = data else {
                    completionHandler(nil, nil)
                    return
            }
            let videos = YouTubeDataParser.parseResponse(nonNilData)
            let token = YouTubeDataParser.parsePageToken(nonNilData)
            completionHandler(videos, token)
        })
    }
    
    private func performGetRequest(_ targetURL: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        var request = URLRequest(url: targetURL) //NSMutableURLRequest(url: targetURL)
        request.httpMethod = Http.Method.GET.rawValue
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: request, completionHandler:completion)
        task.resume()
    }
    
}

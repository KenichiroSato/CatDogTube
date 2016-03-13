//
//  YouTubeClient.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class YouTubeClient: NSObject {

    private let baseUrl = "https://www.googleapis.com/youtube/v3/search"
    
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
        
        let today = DateGenerater.currentDate()
        let dateGenerator = DateGenerater(currentDate: today, minYear: DateGenerater.BOTTOM_YEAR)
        let date : (end:String, start:String) = dateGenerator.generateDetaPair()
        params["publishedBefore"] = date.end
        params["publishedAfter"] = date.start
        print("after:" + date.end + " before:" + date.start)
        
        return params
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

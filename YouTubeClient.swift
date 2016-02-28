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
    
    private var searchParams = [
        "key" : "AIzaSyC1jZ8NyoZ_td6agdjK8kZRuAU5wjTSET0",
        "part" : "snippet",
        "type" : "video",
        "videoDuration" : "short",
        "maxResults" : "30",
        "order" : "viewCount",
        "publishedBefore" : "2013-03-01T00:00:00Z",
        "publishedAfter" : "2013-02-01T00:00:00Z"
    ]
    
    func getVideos(searchWord:String, completionHandler: (videos:[Video]?) -> Void) {

        guard !searchWord.isEmpty else {
            completionHandler(videos: nil)
            return
        }
        
        searchParams["q"] = searchWord
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

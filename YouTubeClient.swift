//
//  YouTubeClient.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class YouTubeClient: NSObject {

    private let searchBaseUrl = "https://www.googleapis.com/youtube/v3/search?key=%@&q=%@&part=snippet&maxResults=30&order=date&type=video&videoDuration=short"
    
    private let myKey = "AIzaSyC1jZ8NyoZ_td6agdjK8kZRuAU5wjTSET0"

    func getVideos(searchWord:String, completionHandler: (videos:[Video]?) -> Void) {
        guard let encodedString = searchWord.urlEncodes() where !searchWord.isEmpty else {
            completionHandler(videos: nil)
            return
        }
        let searchUrlString = String(format: searchBaseUrl, arguments: [myKey, encodedString])
        guard let requestUrl = NSURL(string: searchUrlString) else {
            completionHandler(videos: nil)
            return
        }
        
        performGetRequest(requestUrl, completion: {(data, response, error) in
            guard let code = (response as? NSHTTPURLResponse)?.statusCode where code == 200,
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
        request.HTTPMethod = "GET"
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfiguration)
        let task = session.dataTaskWithRequest(request, completionHandler:completion)
        task.resume()
    }
    
}

//
//  YouTubeClient.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SwiftyJSON

class YouTubeClient: NSObject {

    private let searchBaseUrl = "https://www.googleapis.com/youtube/v3/search?key=%@&q=%@&part=snippet&maxResults=10&order=viewCount&type=video&videoDefinition=high&videoDuration=short&publishedAfter=2015-01-01T00:00:00Z"
    
    private let myKey = "AIzaSyC1jZ8NyoZ_td6agdjK8kZRuAU5wjTSET0"
    var title: String = String()
    var creator: String = String()
    var imageUrl: String = String()

    func getItem(searchWord:String) {
        let searchUrlString = String(format: searchBaseUrl, arguments: [myKey, searchWord])
        guard let requestUrl = NSURL(string: searchUrlString) else {return}
        
        performGetRequest(requestUrl, completion: {(data, response, error) in
            guard let code = (response as? NSHTTPURLResponse)?.statusCode else {return}
            guard let nonNilData = data else {return}
            
            print(code)
            self.parseResponse(nonNilData)
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
    
    private func parseResponse(data: NSData) {
        let json = JSON(data: data)
        
        var videos:[Video] = []
        
        for (_, subJson):(String, JSON) in json["items"] {
            let snippet = subJson["snippet"]
            
            if let videoId = subJson["id"]["videoId"].string,
                let title = snippet["title"].string,
                let urlString = snippet["thumbnails"]["high"]["url"].string,
                let url = NSURL(string: urlString){
                    let video = Video(id: videoId, title: title, url: url)
                    videos.append(video)
            }
        }
        
        videos.forEach({
            print($0.description)
        })
    }
}

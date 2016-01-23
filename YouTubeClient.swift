//
//  YouTubeClient.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/17.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit

class YouTubeClient: NSObject {

    private let searchBaseUrl = "https://www.googleapis.com/youtube/v3/search?key=%@&q=%@&part=snippet&maxResults=10&order=viewCount&type=video&videoDefinition=high&videoDuration=short&publishedAfter=2015-01-01T00:00:00Z"
    
    private let videoId: String = "PqJNc9KVIZE"
    private let myKey = "AIzaSyC1jZ8NyoZ_td6agdjK8kZRuAU5wjTSET0"
    var title: String = String()
    var creator: String = String()
    var imageUrl: String = String()
    

    func getItem(searchWord:String) {
        let searchUrl = String(format: searchBaseUrl, arguments: [myKey, searchWord])
        let requestUrl: NSURL? = NSURL(string: searchUrl)
        
        if let url = requestUrl {
            performGetRequest(url, completion: {(data, code, error) in
                print(code)
                do {
                    let resultsDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! Dictionary<NSObject, AnyObject>
                    print(resultsDict)
                } catch {}

                
            })
        }
    }
    
    private func performGetRequest(targetURL: NSURL, completion: (data: NSData?, HTTPStatusCode: Int, error: NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: targetURL)
        request.HTTPMethod = "GET"
        
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfiguration)
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(data: data, HTTPStatusCode: (response as! NSHTTPURLResponse).statusCode, error: error)
            })
        })
        
        task.resume()
    }
    
    /*
    func setYouTubeVideoInformation() {
            var apiUrl: String = "https://www.googleapis.com/youtube/v3/videos?id=\(self.videoId)&key=\(self.myKey)&fields=items(id,snippet(channelTitle,title,thumbnails),statistics)&part=snippet,contentDetails,statistics"
            
            // create request object
            var requestUrl: NSURL = NSURL(string: apiUrl)!
            var request: NSURLRequest = NSURLRequest(URL: requestUrl)
            
            // request to api
        var data: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        
        
            // read json response
            let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
            let itemsArray: NSArray = json.objectForKey("items") as NSArray
            let items: NSDictionary = itemsArray[0] as NSDictionary
            let snippet: NSDictionary = items.objectForKey("snippet") as NSDictionary
            
            // title
            let title: NSString = snippet.objectForKey("title") as NSString
            self.title = title
            
            // channel title
            let channelTitle: NSString = snippet.objectForKey("channelTitle") as NSString
            self.creator = channelTitle
            
            // thumbnail image
            let thumbnails: NSDictionary = snippet.objectForKey("thumbnails") as NSDictionary
            let resolution: NSDictionary = thumbnails.objectForKey("high") as NSDictionary
            let imageUrl: NSString = resolution.objectForKey("url") as NSString
            
            self.imageUrl = imageUrl
    }
*/
}

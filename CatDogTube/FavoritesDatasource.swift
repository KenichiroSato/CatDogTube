//
//  FavoriteVideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/23.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import UIKit
import CoreData

/**
 managedObjectContext initialization is based on below information
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/InitializingtheCoreDataStack.html
 */

class FavoritesDatasource: NSObject, FavoritesRepositoryProtocol{

    static private let XCDATAMODELD_NAME = "Favorites"
    
    let moc: NSManagedObjectContext
    
    override init() {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = NSBundle.mainBundle().URLForResource(
            FavoritesDatasource.XCDATAMODELD_NAME, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = psc

        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.URLByAppendingPathComponent(FavoritesDatasource.XCDATAMODELD_NAME + ".sqlite")
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
    
    /**
     - returns: true when save succeed, false if fail
     */
    func saveVideo(videoId:String, title:String, imageUrl:String, contentType:Int16) -> Bool {
        guard let entity = NSEntityDescription.entityForName(
            FavoriteVideo.NAME, inManagedObjectContext: moc),
            let video = NSManagedObject(entity: entity, insertIntoManagedObjectContext: moc)
                as? FavoriteVideo else {
                    return false
        }
        
        video.videoId = videoId
        video.title = title
        video.imageUrl = imageUrl
        video.contentType = contentType
        
        do {
            try moc.save()
            return true
        } catch {
            return false
        }
    }
    
    func loadVideos(completionHandler: (videos:[FavoriteVideo]?) -> Void) {
        let employeesFetch = NSFetchRequest(entityName: FavoriteVideo.NAME)
        do {
             let videos =  try moc.executeFetchRequest(employeesFetch) as? [FavoriteVideo]
            completionHandler(videos: videos)
        } catch {
            completionHandler(videos: nil)
        }
    }
}

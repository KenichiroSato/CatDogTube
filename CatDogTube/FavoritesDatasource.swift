//
//  FavoriteVideoRepository.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/23.
//  Copyright © 2016年 Kenichiro Sato. All rights reserved.
//

import Foundation
import CoreData

/**
 managedObjectContext initialization is based on below information
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/InitializingtheCoreDataStack.html
 */

class FavoritesDatasource: NSObject, FavoritesDataSourceProtocol{

    static private let XCDATAMODELD_NAME = "Favorites"
    
    let moc: NSManagedObjectContext
    
    override init() {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = Bundle.main.url(
            forResource: FavoritesDatasource.XCDATAMODELD_NAME, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = psc

        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.appendingPathComponent(FavoritesDatasource.XCDATAMODELD_NAME + ".sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
    
    /**
     - returns: true when save succeed, false if fail
     */
    func saveFavorite(_ videoId:String, title:String, imageUrl:String, contentType:Int16) -> Bool {
        guard let entity = NSEntityDescription.entity(
            forEntityName: FavoriteVideo.NAME, in: moc),
            let video = NSManagedObject(entity: entity, insertInto: moc)
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
    
    func loadVideos(_ completionHandler: (_ videos:[FavoriteVideo]?) -> Void) {
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: FavoriteVideo.NAME)
        do {
             let videos =  try moc.fetch(employeesFetch) as? [FavoriteVideo]
            completionHandler(videos)
        } catch {
            completionHandler(nil)
        }
    }
}

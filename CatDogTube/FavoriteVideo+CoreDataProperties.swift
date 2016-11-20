//
//  FavoriteVideo+CoreDataProperties.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/04/23.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavoriteVideo {

    @NSManaged var imageUrl: String
    @NSManaged var title: String
    @NSManaged var videoId: String
    @NSManaged var contentType: Int16

}

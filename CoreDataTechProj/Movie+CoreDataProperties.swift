//
//  Movie+CoreDataProperties.swift
//  CoreDataTechProj
//
//  Created by Bagus Triyanto on 18/07/20.
//  Copyright © 2020 BagusIsGood. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown Director"
    }

}

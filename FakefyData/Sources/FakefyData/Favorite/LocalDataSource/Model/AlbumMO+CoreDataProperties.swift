//
//  AlbumMO+CoreDataProperties.swift
//  
//
//  Created by Ney Moura on 16/11/21.
//
//

import Foundation
import CoreData


extension AlbumMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlbumMO> {
        return NSFetchRequest<AlbumMO>(entityName: "AlbumMO")
    }

    @NSManaged public var artistId: Int64
    @NSManaged public var artistName: String?
    @NSManaged public var artistViewUrl: String?
    @NSManaged public var artworkUrl60: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionCensoredName: String?
    @NSManaged public var collectionExplicitness: String?
    @NSManaged public var collectionId: Int64
    @NSManaged public var collectionName: String?
    @NSManaged public var collectionPrice: Double
    @NSManaged public var collectionViewUrl: String?
    @NSManaged public var copyright: String?
    @NSManaged public var country: String?
    @NSManaged public var currency: String?
    @NSManaged public var primaryGenreName: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var trackCount: Int64
    @NSManaged public var wrapperType: String?

}

//
//  FavoriteCurrency+CoreDataProperties.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//
//

import Foundation
import CoreData


extension FavoriteCurrency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteCurrency> {
        return NSFetchRequest<FavoriteCurrency>(entityName: "FavoriteCurrency")
    }

    @NSManaged public var formattedPrice: String?
    @NSManaged public var id: String?
    @NSManaged public var imageURL: URL?
    @NSManaged public var name: String?
    @NSManaged public var priceChange: String?
    @NSManaged public var symbol: String?

}

extension FavoriteCurrency : Identifiable {

}

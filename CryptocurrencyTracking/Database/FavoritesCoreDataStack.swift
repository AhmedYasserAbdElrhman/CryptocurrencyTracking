//
//  FavoritesCoreDataStack.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import CoreData
struct FavoritesCoreDataStack {
    static let stack = CoreDataStack.create(modelName: "FavoriteCurrencyDataFile")
    
    /// Provides the context for `FavoritesModel`
    static var context: NSManagedObjectContext {
        stack.context
    }
}

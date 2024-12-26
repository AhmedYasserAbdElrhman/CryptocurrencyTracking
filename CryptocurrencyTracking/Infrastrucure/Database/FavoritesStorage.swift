//
//  FavoritesStorage.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


import CoreData

final class FavoritesStorage: FavoritesRepositoryProtocol {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = FavoritesCoreDataStack.context) {
        self.context = context
    }
    
    func addFavorite(currency: CurrencyPresentedModel) throws {
        
        // Check if the item already exists to avoid duplicates
        if isFavorite(id: currency.id) {
            print("Item with id \(currency.id) is already a favorite.")
            return
        }
        
        // Create a new FavoriteItem
        let favorite = FavoriteCurrency(context: context)
        favorite.id = currency.id
        favorite.name = currency.name
        favorite.symbol = currency.symbol
        favorite.formattedPrice = currency.formattedPrice
        favorite.priceChange = currency.priceChange
        favorite.imageURL = currency.imageURL
        
        // Save the context
        try saveContext()
    }
    

    func deleteFavorite(id: String) throws {
        // Fetch the item to delete
        let fetchRequest: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.fetchLimit = 1
        
        let results = try context.fetch(fetchRequest)
        if let favoriteToDelete = results.first {
            context.delete(favoriteToDelete)
            try saveContext()
        } else {
            print("No favorite item found with id \(id).")
        }
    }

    func fetchFavorites() throws -> [FavoriteCurrency] {
        let fetchRequest: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return try context.fetch(fetchRequest)
    }
    func isFavorite(id: String) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.fetchLimit = 1
        let count = try? context.count(for: fetchRequest)
        return (count ?? 0 ) > 0
    }

    private func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }

}

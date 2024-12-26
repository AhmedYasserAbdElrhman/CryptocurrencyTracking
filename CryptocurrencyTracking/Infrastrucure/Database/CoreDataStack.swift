//
//  CoreDataStack.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


import CoreData

final class CoreDataStack {
    private let persistentContainer: NSPersistentContainer
    
    /// Context for accessing and managing data
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    /// Initialize CoreDataStack with a given model name
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    /// Save changes to the context
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error saving context: \(error)")
            }
        }
    }
    
    /// Factory method for convenience
    static func create(modelName: String) -> CoreDataStack {
        return CoreDataStack(modelName: modelName)
    }
}

//
//  PersistentStorage.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 01/08/22.
//

import CoreData

final class PersistentStorage {
    
    private init() { }
    
    static let shared: PersistentStorage = PersistentStorage()
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Users")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() throws {
            guard context.hasChanges else { return }
            try context.save()
        }
    
}

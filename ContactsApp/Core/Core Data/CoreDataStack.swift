//
//  CoreDataStack.swift
//  WeatherApp
//
//  Created by Maryan Pasichniak on 10/4/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Properties
    lazy var applicationDocumentsDirectory: URL = {
        return NSPersistentContainer.defaultDirectoryURL()
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = { [weak self] in
        guard let strongSelf = self else {fatalError("managedObjectContext self = nil")}
        let mainContext = strongSelf.persistentStoreContainer.viewContext
        return mainContext
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "ContactsApp", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreContainer: NSPersistentContainer = { [weak self] in
        guard let strongSelf = self else {fatalError("Error to init persistentStoreContainer")}
        let container = NSPersistentContainer(name: "ContactsApp", managedObjectModel: strongSelf.managedObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
        }()
    
    // MARK: - Initializers
    init() {
        saveContext(context: managedObjectContext)
    }
    
    // MARK: - Public Methods
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.persistentStoreContainer.performBackgroundTask(block)
    }
    
    func saveContext(context: NSManagedObjectContext) {
        if context.hasChanges {
            persistentStoreContainer.persistentStoreCoordinator.performAndWait({
                do {
                    try context.save()
                } catch {
                    fatalError("Core Data: failed to save the managed object context. An error has ocurred: \n\t\(error)")
                }
            })
        }
    }
    
    func cleanDataBase() {
        do {
            let url = applicationDocumentsDirectory.appendingPathComponent("ContactsApp.sqlite")
            try persistentStoreContainer.persistentStoreCoordinator.destroyPersistentStore(at: url, ofType: NSSQLiteStoreType, options: nil)
            try managedObjectContext.persistentStoreCoordinator?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
    }
    
    func cleanDataBase(completion: ((_ error: Error?) -> Void)? = nil) {
        let url = applicationDocumentsDirectory.appendingPathComponent("ContactsApp.sqlite")
        managedObjectContext.performAndWait {
            self.managedObjectContext.reset()
            self.persistentStoreContainer.persistentStoreCoordinator.performAndWait {
                for store in self.persistentStoreContainer.persistentStoreCoordinator.persistentStores {
                    guard let storeURL = store.url else { continue }
                    do {
                        try self.persistentStoreContainer.persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: store.options)
                        try! self.persistentStoreContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
                        
                        DispatchQueue.main.async {
                            completion?(nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion?(error)
                        }
                    }
                }
            }
        }
    }
    
}



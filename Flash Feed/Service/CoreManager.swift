//
//  CoreManager.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation
import CoreData

final class CoreManager {
    
    // MARK: - Singleton Stack
    static let shared = CoreManager()
    private init() {}
    
    
    // MARK: - CoreData Stack
    // Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Flash_Feed")
        
        container.loadPersistentStores(completionHandler: { (storeDescrip, err) in
            if let error = err {
                print("JSError: Unable to load CoreData Persistent Store")
                fatalError(error.localizedDescription)
            }
        })
        
        return container
    }()

    // Managed Object Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save Context
    fileprivate func saveContext() {
        do {
            try context.save()
        } catch {
            print("JSError: Unable to save CoreData Managed Object Context")
            fatalError(error.localizedDescription)
        }
    }
    
    
    //MARK: - CRUD Operations
    // Save
    func save(_ source: Source) {
        
        // Check if 'recipe' is already saved
        check(source)
        
        // Create a new Entity
        let entity = NSEntityDescription.entity(forEntityName: "CoreSource", in: context)!
        let coreSource = CoreSource(entity: entity, insertInto: context)
        
        //KVC - Key Value Coding
        coreSource.setValue(source.id, forKey: "id")
        coreSource.setValue(source.name, forKey: "name")
        coreSource.setValue(source.category, forKey: "category")
        coreSource.setValue(source.country, forKey: "country")
        coreSource.setValue(source.descr, forKey: "descr")
        coreSource.setValue(source.language, forKey: "language")
        coreSource.setValue(source.url, forKey: "url")
        
        // Save Managed Object Context
        saveContext()
    }

    // Load
    func load() -> [CoreSource] {
        
        let fetchRequest = NSFetchRequest<CoreSource>(entityName: "CoreSource")
        
        var sources = [CoreSource]()
        
        do {
            // Try NSFetchRequest
            sources = try context.fetch(fetchRequest)
        } catch {
            print("JSError: Couldn't Fetch CoreSources ~> \(error.localizedDescription)")
        }
        
        print("Loaded \(sources.count) '\(String(describing: sources.first?.country))' sources")
        return sources
    }
    
    // Delete
    func delete(_ source: Source) {
        
        let coreSources = load()
        
        for coreSource in coreSources where source.name == coreSource.name {
            context.delete(coreSource)
            print("'\(String(describing: coreSource.country))' source deleted: \(String(describing: coreSource.name))")
        }
        saveContext()
    }
    
    // Delete All
    func deleteAll() {
        
        let coreSources = load()
        
        for coreSource in coreSources {
            context.delete(coreSource)
        }
        
        print("\(coreSources.count) '\(String(describing: coreSources.first?.country))' CoreSources deleted ")
        saveContext()
    }
    
    
    //MARK: - Private Function
    fileprivate func check(_ source: Source) {
        
        let coreSources = load()
        
        for coreSource in coreSources where source.name == coreSource.name {
            context.delete(coreSource)
            return
        }
    }

}


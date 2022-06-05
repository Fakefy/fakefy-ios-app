//
//  TestCoreDataStack.swift
//  FakefyData Tests
//
//  Created by Ney Moura on 19/10/21.
//

import CoreData

class TestCoreDataStack {
    
    private let dataModelName: String = "DataModel"
        
    let container: NSPersistentContainer

    init() {
        
        guard
            let dataModel = Bundle.module.url(forResource: dataModelName, withExtension: "momd"),
            let objectModel = NSManagedObjectModel(contentsOf: dataModel) else {
            fatalError("Error initializing TestCoreDataStack, have you copied the DataModel file from the main target?")
        }

        self.container = NSPersistentContainer(name: dataModelName, managedObjectModel: objectModel)
        
        let inMemoryStore = NSPersistentStoreDescription()
        inMemoryStore.url = URL(fileURLWithPath: "/dev/null")
        container.persistentStoreDescriptions = [inMemoryStore]
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

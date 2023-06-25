//
//  CoreDataManager.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 21/06/23.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    static let instance = CoreDataManager()
    
    init(){
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Load Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func saveData(){
        do{
            try context.save()
            print("Save Successfully")
        } catch {
            print("Error Saving Data. \(error.localizedDescription)")
        }
    }
    
}

//
//  DataBaseService.swift
//  WeatherApp
//
//  Created by Maryan Pasichniak on 10/11/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation
import CoreData

class DataBaseService: DataBaseServiceInput, DependencyInjector {
    
    weak var output: DataBaseServiceOutput?
    
    // MARK: - Public Methods
    func checkJSONFile() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                _ = try JSONDecoder().decode([Contact].self, from: data)
                let context = coreDataStack.managedObjectContext
                try context.save()
            } catch  {
                print("No  JSON files")
            }
        }
    }
    
    func getContactsList() -> [Contact] {
        let fetchRequest = NSFetchRequest<Contact>(entityName: Contact.entityName)
        if let results = try? coreDataStack.managedObjectContext.fetch(fetchRequest) {
            return results
        }
        return []
    }
    
    func addNewContactWith(_ input: ContactInputModel) {
        let context = coreDataStack.managedObjectContext
        if let mark = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context) as? Contact {
            mark.contactID = input.contactID
            mark.firstName = input.firstName
            mark.lastName = input.lastName
            mark.phoneNumber = input.phoneNumber
            mark.streetAddress1 = input.streetAddress1
            mark.streetAddress2 = input.streetAddress2
            mark.city = input.city
            mark.state = input.state
            mark.zipCode = input.zipCode
            do {
                try(context.save())
                self.output?.successAddedContact()
            } catch let err {
                print(err)
            }
        } else {
            print("Wrong Entity")
        }
    }
    
    func updateContactWith(_ input: ContactInputModel) {
        let context = coreDataStack.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        guard let contactID = input.contactID else { return }
        fetchRequest.predicate = NSPredicate(format: "contactID = %@", contactID)
        if let result = try? context.fetch(fetchRequest), result is [Contact] {
            let resultData = result as! [Contact]
            for object in resultData {
                if object.contactID == input.contactID {
                    object.firstName = input.firstName
                    object.lastName = input.lastName
                    object.phoneNumber = input.phoneNumber
                    object.streetAddress1 = input.streetAddress1
                    object.streetAddress2 = input.streetAddress2
                    object.city = input.city
                    object.state = input.state
                    object.zipCode = input.zipCode
                }
            }
        }
        do {
            try context.save()
            self.output?.successAddedContact()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteContactWithId(_ id: String) {
        let context = coreDataStack.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        fetchRequest.predicate = NSPredicate(format: "contactID = %@", id)
        
        if let result = try? context.fetch(fetchRequest), result is [Contact] {
            for object in result as! [Contact] {
                context.delete(object)
            }
        }
        do {
            try context.save()
            self.output?.successAddedContact()
        } catch let error as NSError  {
            print("Could delete \(error), \(error.userInfo)")
        }
        
    }
}


//
//  SqliteCommands.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 23/11/2022.
//

import Foundation
import SQLite

class UserRepository {
    
    static var table = Table("users")
    
    static let id = Expression<UUID>("id")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    
    static func createTable() {
        guard let database =
                SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
            })
        } catch {
            print("table already exists: \(error)")
        }
    }
    
    
    
    static func addUser(_ userValues:User) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(firstName <- userValues.firstName, lastName <- userValues.lastName))
            return true
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Updating Row
    static func updateUser(_ userValues: User) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let contact = table.filter(id == userValues.id).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(contact.update(firstName <- userValues.firstName, lastName <- userValues.lastName)) > 0 {
                print("Updated contact")
                return true
            } else {
                print("Could not update contact: contact not found")
                return false
            }
        } catch let error {
            print("Updation failed: \(error)")
            return false
        }
    }
    
    // Present Rows
    static func getUsers() -> [User]? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var userArray = [User]()
        
        // Sorting data in descending order by ID
        table = table.order(id.desc)
        
        do {
            for user in try database.prepare(table) {
                
                let idValue = user[id]
                let firstNameValue = user[firstName]
                let lastNameValue = user[lastName]
                
                // Create object
                let userObject = User(id: idValue, firstName: firstNameValue, lastName: lastNameValue)
                
                // Add object to an array
                userArray.append(userObject)
                
                print("id \(user[id]), firstName: \(user[firstName]), lastName: \(user[lastName])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return userArray
    }
    
    // Delete Row
    static func deleteUser(userId: UUID) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let contact = table.filter(id == userId).limit(1)
            try database.run(contact.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}

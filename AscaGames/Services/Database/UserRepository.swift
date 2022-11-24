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
    
    static let idUser = Expression<UUID>("idUser")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    
    
    static func addUser(_ userValues:User) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(idUser <- userValues.idUser ,firstName <- userValues.firstName, lastName <- userValues.lastName))
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
        let user = table.filter(idUser == userValues.idUser).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(user.update(firstName <- userValues.firstName, lastName <- userValues.lastName)) > 0 {
                print("Updated user")
                return true
            } else {
                print("Could not update user: user not found")
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
        table = table.order(idUser.desc)
        
        do {
            for user in try database.prepare(table) {
                
                let idUserValue = user[idUser]
                let firstNameValue = user[firstName]
                let lastNameValue = user[lastName]
                
                // Create object
                let userObject = User(idUser: idUserValue, firstName: firstNameValue, lastName: lastNameValue, elo: 1500)
                
                // Add object to an array
                userArray.append(userObject)
                
                print("id \(user[idUser]), firstName: \(user[firstName]), lastName: \(user[lastName])")
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
            let user = table.filter(idUser == userId).limit(1)
            try database.run(user.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}

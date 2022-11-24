//
//  MatchTypeRepository.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation
import SQLite

class MatchTypeRepository {
    
    static var table = Table("matchType")
    
    static let id = Expression<UUID>("id")
    static let lib = Expression<String>("lib")
    
    static func createTable() {
        guard let database =
                SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(lib)
            })
        } catch {
            print("table already exists: \(error)")
        }
    }
    
    
    
    static func addMatchType(_ matchTypeValues:MatchType) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(id <- matchTypeValues.id , lib <- matchTypeValues.lib))
            return true
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Updating Row
    static func updateMatchType(_ matchTypeValues: MatchType) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let matchType = table.filter(id == matchTypeValues.id).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(matchType.update(lib <- matchTypeValues.lib)) > 0 {
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
    static func getMatchTypes() -> [MatchType]? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var matchTypeArray = [MatchType]()
        
        // Sorting data in descending order by ID
        table = table.order(id.desc)
        
        do {
            for matchType in try database.prepare(table) {
                
                let idValue = matchType[id]
                let libValue = matchType[lib]
                
                // Create object
                let matchTypeObject = MatchType(id: idValue, lib: libValue)
                
                // Add object to an array
                matchTypeArray.append(matchTypeObject)
                
                print("id \(matchType[lib]), lib: \(matchType[lib])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return matchTypeArray
    }
    
    // Delete Row
    static func deleteMatchType(matchTypeId: UUID) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let matchType = table.filter(id == matchTypeId).limit(1)
            try database.run(matchType.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}

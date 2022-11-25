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
    
    static let idMatchType = Expression<Int64>("idMatchType")
    static let lib = Expression<String>("lib")
    
    
    static func addMatchType(_ matchTypeValues:MatchType) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(lib <- matchTypeValues.lib))
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
        let matchType = table.filter(idMatchType == matchTypeValues.idMatchType).limit(1)
        
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
        table = table.order(idMatchType.desc)
        
        do {
            for matchType in try database.prepare(table) {
                
                let idMatchTypeValue = matchType[idMatchType]
                let libValue = matchType[lib]
                
                // Create object
                let matchTypeObject = MatchType(idMatchType: idMatchTypeValue, lib: libValue)
                
                // Add object to an array
                matchTypeArray.append(matchTypeObject)
                
                print("id \(matchType[idMatchType]), lib: \(matchType[lib])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return matchTypeArray
    }
    
    // Delete Row
    static func deleteMatchType(matchTypeId: Int64) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let matchType = table.filter(idMatchType == matchTypeId).limit(1)
            try database.run(matchType.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}

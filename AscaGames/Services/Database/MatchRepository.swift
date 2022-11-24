//
//  MatchRepository.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation
import SQLite

class MatchRepository {
    
    static var table = Table("matchs")
    
    static let id = Expression<UUID>("id")
    static let nbSets = Expression<Int>("nbSets")
    
    static func createTable() {
        guard let database =
                SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(nbSets)
            })
        } catch {
            print("table already exists: \(error)")
        }
    }
    
    
    
    static func addMatch(_ matchValues:Match) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(id <- matchValues.id ,nbSets <- matchValues.nbSets))
            return true
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Updating Row
    static func updateMatch(_ matchValues: Match) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let match = table.filter(id == matchValues.id).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(match.update(nbSets <- matchValues.nbSets)) > 0 {
                print("Updated match")
                return true
            } else {
                print("Could not update match: match not found")
                return false
            }
        } catch let error {
            print("Updation failed: \(error)")
            return false
        }
    }
    
    // Present Rows
    static func getMatchs() -> [Match]? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var matchArray = [Match]()
        
        // Sorting data in descending order by ID
        table = table.order(id.desc)
        
        do {
            for match in try database.prepare(table) {
                
                let idValue = match[id]
                let nbSetsValue = match[nbSets]
                
                // Create object
                let matchObject = Match(id: idValue, nbSets: nbSetsValue)
                
                // Add object to an array
                matchArray.append(matchObject)
                
                print("id \(match[id]), nbSets: \(match[nbSets])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return matchArray
    }
    
    // Delete Row
    static func deleteMatch(matchId: UUID) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let match = table.filter(id == matchId).limit(1)
            try database.run(match.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}


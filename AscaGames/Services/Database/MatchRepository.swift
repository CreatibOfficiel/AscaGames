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
    
    static let idMatch = Expression<Int64>("idMatch")
    static let nbSets = Expression<Int>("nbSets")
    static let idMatchType = Expression<Int64>("idMatchType")
    
    
    
    static func addMatch(_ matchValues:Match) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(nbSets <- matchValues.nbSets, idMatchType <- matchValues.idMatchType))
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
        let match = table.filter(idMatch == matchValues.idMatch).limit(1)
        
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
        table = table.order(idMatch.desc)
        
        do {
            for match in try database.prepare(table) {
                
                let idMatchValue = match[idMatch]
                let nbSetsValue = match[nbSets]
                let idMatchTypeValue = match[idMatchType]
                
                // Create object
                let matchObject = Match(idMatch: idMatchValue, nbSets: nbSetsValue, idMatchType: idMatchTypeValue)
                
                // Add object to an array
                matchArray.append(matchObject)
                
                print("idMatch \(match[idMatch]), nbSets: \(match[nbSets]), idMatchType \(match[idMatchType])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return matchArray
    }
    
    // Delete Row
    static func deleteMatch(matchId: Int64) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let match = table.filter(idMatch == matchId).limit(1)
            try database.run(match.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
}


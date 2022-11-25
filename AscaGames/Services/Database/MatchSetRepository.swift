//
//  MatchSetRepository.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation
import SQLite

class MatchSetRepository {
    
    static var table = Table("matchSets")
    
    static let idMatchSet = Expression<UUID>("idMatchSet")
    static let idMatch = Expression<UUID>("idMatch")
    static let numSet = Expression<Int>("numSet")
    static let scoreTL = Expression<Int>("scoreTL")
    static let scoreTR = Expression<Int>("scoreTR")
    
    
    static func addMatchSet(_ matchSetValues:MatchSet) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(idMatchSet <- matchSetValues.idMatchSet, idMatch <- matchSetValues.idMatch, numSet <- matchSetValues.numSet, scoreTL <- matchSetValues.scoreTL, scoreTR <- matchSetValues.scoreTR))
            return true
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Updating Row
    static func updateMatchSet(_ matchSetValues: MatchSet) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let match = table.filter(idMatchSet == matchSetValues.idMatchSet).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(match.update(idMatch <- matchSetValues.idMatch, numSet <- matchSetValues.numSet, scoreTL <- matchSetValues.scoreTL, scoreTR <- matchSetValues.scoreTR)) > 0 {
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
    static func getMatchSets() -> [MatchSet]? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var matchSetArray = [MatchSet]()
        
        // Sorting data in descending order by ID
        table = table.order(idMatchSet.desc)
        
        do {
            for matchSet in try database.prepare(table) {
                
                let idMatchSetValue = matchSet[idMatchSet]
                let idMatchValue = matchSet[idMatch]
                let numSetValue = matchSet[numSet]
                let scoreTLValue = matchSet[scoreTL]
                let scoreTRValue = matchSet[scoreTR]
                
                // Create object
                let matchSetObject = MatchSet(idMatchSet: idMatchSetValue, idMatch: idMatchValue, numSet: numSetValue, scoreTL: scoreTLValue, scoreTR: scoreTRValue)
                
                // Add object to an array
                matchSetArray.append(matchSetObject)
                
                print("idMatchSet \(matchSet[idMatchSet]), idMatch \(matchSet[idMatch]), numSet: \(matchSet[numSet]), scoreTL \(matchSet[scoreTL]), scoreTR \(matchSet[scoreTR])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return matchSetArray
    }
    
    // Delete Row
    static func deleteMatchSet(matchSetId: UUID) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let matchSet = table.filter(idMatchSet == matchSetId).limit(1)
            try database.run(matchSet.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
}

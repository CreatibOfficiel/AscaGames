//
//  PlayRepository.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation
import SQLite

class PlayRepository {
    
    static var table = Table("plays")
    
    static let idUser = Expression<UUID>("idUser")
    static let idMatch = Expression<UUID>("idMatch")
    static let isWinner = Expression<Bool>("isWinner")
    
    
    
    static func addPlay(_ playValues:Play) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(idUser <- playValues.idUser, idMatch <- playValues.idMatch, isWinner <- playValues.isWinner))
            return true
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    // Updating Row
    static func updatePlay(_ playValues: Play) -> Bool? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let play = table.filter(idUser == playValues.idUser && idMatch == playValues.idMatch).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(play.update(isWinner <- playValues.isWinner)) > 0 {
                print("Updated play")
                return true
            } else {
                print("Could not update play: play not found")
                return false
            }
        } catch let error {
            print("Updation failed: \(error)")
            return false
        }
    }
    
    // Present Rows
    static func getPlays() -> [Play]? {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var playArray = [Play]()
        
        // Sorting data in descending order by ID
        table = table.order(idMatch.desc)
        
        do {
            for play in try database.prepare(table) {
                
                let idUserValue = play[idUser]
                let idMatchValue = play[idMatch]
                let isWinnerValue = play[isWinner]
                
                // Create object
                let playObject = Play(idUser: idUserValue, idMatch: idMatchValue, isWinner: isWinnerValue)
                
                // Add object to an array
                playArray.append(playObject)
                
                print("idUser \(play[idUser]), idMatch: \(play[idMatch]), isWinner \(play[isWinner])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return playArray
    }
    
    // Delete Row
    static func deletePlay(UserId: UUID, MatchId: UUID) {
        guard let database = SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let play = table.filter(idUser == UserId && idMatch == MatchId).limit(1)
            try database.run(play.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
}

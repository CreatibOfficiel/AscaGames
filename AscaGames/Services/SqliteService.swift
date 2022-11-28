//
//  SqliteService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 23/11/2022.
//

import Foundation
import SQLite

class SqliteService {
    static let sharedInstance = SqliteService()
    var database : Connection?
    
    private init() {
        
        do {
            let documentDirectory = try
                FileManager.default.url(for: .documentDirectory,
                in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl =
                documentDirectory
                .appendingPathComponent("AscaGames")
                .appendingPathExtension("sqlite3")
            
            database = try Connection(fileUrl.path)
        } catch {
            print("Creating connection to database error: \(error)")
        }
    }
    
    func createTable() {
        SqlRepository.createTables()
        if(MatchTypeService().getMatchTypes().count == 0) {
            addMatchType()
        }
        //addMatch()
        
    }
    
    func addMatchType() {
        MatchTypeService().addMatchType(matchType: MatchType(idMatchType: UUID(), lib: "babyfoot"))
        MatchTypeService().addMatchType(matchType: MatchType(idMatchType: UUID(), lib: "ping pong"))
    }
    
    func addMatch() {
        let users = UserService().getUsers()
        let torgue: User = users.first(where: {$0.firstName == "Torgue"})!
        let splinter: User = users.first(where: {$0.firstName == "Splinter"})!
        
        let set1 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 1, scoreTL: 10, scoreTR: 3)
        let set2 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 2, scoreTL: 10, scoreTR: 1)
        
        let matchHistory = MatchHistory(teamWin: [torgue], teamLoose: [splinter], nbSets: 2, matchType: "babyfoot", sets: [set1, set2])
        
        MatchService().addMatchHistory(matchHistory: matchHistory)
    }
}

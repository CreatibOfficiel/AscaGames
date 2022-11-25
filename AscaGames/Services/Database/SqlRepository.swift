//
//  SqlRepository.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation
import SQLite

class SqlRepository {
    
    static var usersTable = Table("users")
    static var matchTypesTable = Table("matchTypes")
    static var matchsTable = Table("matchs")
    static var matchSetsTable = Table("matchSets")
    static var PlayTable = Table("plays")
    
    static let idUser = Expression<UUID>("idUser")
    static let idMatchType = Expression<UUID>("idMatchType")
    static let idMatch = Expression<UUID>("idMatch")
    static let idMatchSet = Expression<UUID>("idMatchSet")
    
    //User
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    //MatchType
    static let lib = Expression<String>("lib")
    //Match
    static let nbSets = Expression<Int>("nbSets")
    //MatchSet
    static let numSet = Expression<Int>("numSet")
    static let scoreTL = Expression<Int>("scoreTL")
    static let scoreTR = Expression<Int>("scoreTR")
    //Play
    static let isWinner = Expression<Bool>("isWinner")
    
    
    static func createTables() {
        guard let database =
                SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            dropTables()
            
            //User
            try database.run(usersTable.create(ifNotExists: true) { usersTable in
                usersTable.column(idUser, primaryKey: true)
                usersTable.column(firstName)
                usersTable.column(lastName)
            })
            
            //MatchType
            try database.run(matchTypesTable.create(ifNotExists: true) { matchTypesTable in
                matchTypesTable.column(idMatchType, primaryKey: true)
                matchTypesTable.column(lib)
            })
            
            //Match
            try database.run(matchsTable.create(ifNotExists: true) { matchsTable in
                matchsTable.column(idMatch, primaryKey: true)
                matchsTable.column(nbSets)
                matchsTable.column(idMatchType)
                matchsTable.foreignKey(idMatchType, references: matchTypesTable, idMatchType)
            })
            
            //MatchSet
            try database.run(matchSetsTable.create(ifNotExists: true) { matchSetsTable in
                matchSetsTable.column(idMatchSet, primaryKey: true)
                matchSetsTable.column(idMatch)
                matchSetsTable.foreignKey(idMatch, references: matchsTable, idMatch, delete: .setNull)
            })
            
            //Play
            try database.run(PlayTable.create(ifNotExists: true) { playTable in
                playTable.column(idUser)
                playTable.column(idMatch)
                playTable.column(isWinner)
                playTable.foreignKey(idUser, references: usersTable, idUser)
                playTable.foreignKey(idMatch, references: matchsTable, idMatch)
                playTable.primaryKey(idUser, idMatch)
            })
            
        } catch {
            print("table already exists: \(error)")
        }
        
    }
    
    static func dropTables() {
        guard let database =
                SqliteService.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            try database.run(usersTable.drop())
            try database.run(matchTypesTable.drop())
            try database.run(matchsTable.drop())
            try database.run(matchSetsTable.drop())
            
        } catch {
            print("drop error: \(error)")
        }
    }
}

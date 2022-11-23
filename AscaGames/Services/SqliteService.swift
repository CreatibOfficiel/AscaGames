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
        UserRepository.createTable()
    }
}

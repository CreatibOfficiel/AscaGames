//
//  AscaGamesApp.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

let theme = MainTheme()
let db = SqliteService.sharedInstance

@main
struct AscaGamesApp: App {
    
    init() {
        db.createTable()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

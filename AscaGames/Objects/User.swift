//
//  File.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import Foundation

struct User : Hashable {
    var idUser: UUID
    var firstName: String
    var lastName: String
    var elo: Int
}

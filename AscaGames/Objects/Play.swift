//
//  Play.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation

struct Play : Hashable {
    var idUser: UUID
    var idMatch: UUID
    var isWinner: Bool
}

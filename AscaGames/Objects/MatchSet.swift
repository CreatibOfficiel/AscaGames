//
//  Set.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation

struct MatchSet : Hashable {
    var idMatchSet: UUID
    var idMatch: UUID
    var numSet: Int
    var scoreTL: Int
    var scoreTR: Int
}

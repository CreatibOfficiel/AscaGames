//
//  MatchHistory.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 28/11/2022.
//

import Foundation

struct MatchHistory: Hashable {
    var teamWin: [User]
    var teamLoose: [User]
    var nbSets: Int
}

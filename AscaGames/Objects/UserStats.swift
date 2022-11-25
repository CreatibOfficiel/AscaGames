//
//  UserRanking.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation

struct UserStats : Hashable {
    var user: User
    var wins: Int
    var matches: Int
}

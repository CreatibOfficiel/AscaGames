//
//  UserService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import Foundation

class UserService {
        
    func getUsers() -> [User] {
        let users = UserRepository.getUsers()
        if(users != nil) {
            return users!
        }
        return []
    }
    
    func addUser(user: User) -> Void {
        let isSuccess = UserRepository.addUser(user)
        
        print(isSuccess ?? "")
    }
    
    func updateUser(user: User) -> Void {
        let isSuccess = UserRepository.updateUser(user)
        
        print(isSuccess ?? "")
    }
    
    func deleteUser(id: UUID) -> Void {
        UserRepository.deleteUser(userId: id)
    }
    
    func getUserStats() -> [UserStats] {
        let users = getUsers()
        let plays = PlayService().getPlays()
        var userStats: [UserStats] = []
        
        for user in users {
            let nbOfMatches = plays.filter { $0.idUser == user.idUser}.count
            let nbOfWins = plays.filter {$0.idUser == user.idUser && $0.isWinner == true}.count
            userStats.append(UserStats(user: user, wins: nbOfWins, matches: nbOfMatches))
        }
        
        userStats.sort(by: {higher, lower in
            return higher.user.elo > lower.user.elo
        })
        
        print(userStats)
        
        return userStats
    }

}


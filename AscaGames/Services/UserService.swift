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
    
    func updateElo(matchHistory: MatchHistory) -> Void {
        let nbPlayers = matchHistory.teamWin.count
        var eloWin = 0
        var eloLoose = 0
        var pointsPlayed = 0
        
        for i in 0...nbPlayers - 1 {
            eloWin += matchHistory.teamWin[i].elo
            eloLoose += matchHistory.teamLoose[i].elo
        }
        
        eloWin = eloWin / nbPlayers
        eloLoose = eloLoose / nbPlayers
        
        //get elo diff
        var eloDiff = 0
        
        if(eloWin > eloLoose) {
            eloDiff = eloWin - eloLoose
        }
        if(eloLoose > eloWin) {
            eloDiff = eloLoose - eloWin
        }
        
        //Set points to win/lose
        if(eloDiff > 100) {
            pointsPlayed = 100 / (eloDiff / 100)
        } else {
            if(eloDiff > 1000) {
                pointsPlayed = 10
            } else {
                pointsPlayed = 100
            }
        }
        
        for i in 0...nbPlayers - 1 {
            var winner = matchHistory.teamWin[i]
            winner.elo += pointsPlayed
            updateUser(user: winner)
            
            var looser = matchHistory.teamLoose[i]
            looser.elo -= pointsPlayed
            updateUser(user: looser)
        }
    }
}


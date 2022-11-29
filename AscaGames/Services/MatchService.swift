//
//  MatchService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation

class MatchService {
        
    func getMatchs() -> [Match] {
        let matchs = MatchRepository.getMatchs()
        if(matchs != nil) {
            return matchs!
        }
        return []
    }
    
    func addMatch(match: Match) -> Void {
        let isSuccess = MatchRepository.addMatch(match)
        
        print(isSuccess ?? "")
    }
    
    func updateMatch(match: Match) -> Void {
        let isSuccess = MatchRepository.updateMatch(match)
        
        print(isSuccess ?? "")
    }
    
    func deleteMatch(id: UUID) -> Void {
        MatchRepository.deleteMatch(matchId: id)
    }
    
    func getMatchHistory1v1() -> [MatchHistory] {
        
        //Get all data required before filtering
        let matchs = MatchService().getMatchs()
        let matchTypes = MatchTypeService().getMatchTypes()
        var sets = MatchSetService().getMatchSets()
        var users = UserService().getUsers()
        let plays = PlayService().getPlays()
        
        var MatchHistories: [MatchHistory] = []
        //for each match
        for match in matchs {
            
            let type: MatchType = matchTypes.first(where: {$0.idMatchType == match.idMatchType})!
            //get the match sets
            let set: [MatchSet] = sets.filter { $0.idMatch == match.idMatch }
            //get the play table
            let play: [Play] = plays.filter { $0.idMatch == match.idMatch }
            
            //sort winning and losing team
            var teamWin: [User] = []
            var teamLose: [User] = []
            
            for p in play {
                if(p.isWinner) {
                    teamWin.append(users.filter { $0.idUser == p.idUser }.first!)
                } else {
                    teamLose.append(users.filter {$0.idUser == p.idUser}.first!)
                }
            }
            
            let matchHistory = MatchHistory(teamWin: teamWin, teamLoose: teamLose, nbSets: match.nbSets, matchType: type.lib, sets: set)
            
            if(teamWin.count == 1){
                MatchHistories.append(matchHistory)
            }
        }
        return MatchHistories
    }
    
    func getMatchHistory2v2() -> [MatchHistory] {
        
        //Get all data required before filtering
        let matchs = MatchService().getMatchs()
        let matchTypes = MatchTypeService().getMatchTypes()
        var sets = MatchSetService().getMatchSets()
        var users = UserService().getUsers()
        let plays = PlayService().getPlays()
        
        var MatchHistories: [MatchHistory] = []
        //for each match
        for match in matchs {
            
            let type: MatchType = matchTypes.first(where: {$0.idMatchType == match.idMatchType})!
            //get the match sets
            let set: [MatchSet] = sets.filter { $0.idMatch == match.idMatch }
            //get the play table
            let play: [Play] = plays.filter { $0.idMatch == match.idMatch }
            
            //sort winning and losing team
            var teamWin: [User] = []
            var teamLose: [User] = []
            
            for p in play {
                if(p.isWinner) {
                    teamWin.append(users.filter { $0.idUser == p.idUser }.first!)
                } else {
                    teamLose.append(users.filter {$0.idUser == p.idUser}.first!)
                }
            }
            
            let matchHistory = MatchHistory(teamWin: teamWin, teamLoose: teamLose, nbSets: match.nbSets, matchType: type.lib, sets: set)
            
            if(teamWin.count == 2){
                MatchHistories.append(matchHistory)
            }
        }
        return MatchHistories
    }
    
    func addMatchHistory(matchHistory: MatchHistory) {
        let getMatchTypes = MatchTypeService().getMatchTypes()
        let getMatchType: MatchType = getMatchTypes.first(where: {$0.lib == matchHistory.matchType})!
        
        //Add match
        let matchAdded = Match(idMatch: UUID(), nbSets: matchHistory.nbSets, idMatchType: getMatchType.idMatchType)
        addMatch(match: matchAdded)
        
        //Add winenrs
        for winner in matchHistory.teamWin {
            PlayService().addPlay(play: Play(idUser: winner.idUser, idMatch: matchAdded.idMatch, isWinner: true))
        }
        
        //Add losers
        for looser in matchHistory.teamLoose {
            PlayService().addPlay(play: Play(idUser: looser.idUser, idMatch: matchAdded.idMatch, isWinner: false))
            
        }
        
        //add sets
        for set in matchHistory.sets {
            MatchSetService().addMatchSet(matchSet: MatchSet(idMatchSet: set.idMatchSet, idMatch: matchAdded.idMatch, numSet: set.numSet, scoreTL: set.scoreTL, scoreTR: set.scoreTR))
        }
        
        UserService().updateElo(matchHistory: matchHistory)
    }
}

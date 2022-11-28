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
    
    func getMatchHistory() -> [MatchHistory] {
        return MatchRepository.getMatchHistory()
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
    }
}

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
}

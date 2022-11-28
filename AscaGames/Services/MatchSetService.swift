//
//  MatchSetService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation

public class MatchSetService {
    
    func getMatchSets() -> [MatchSet] {
        let matchSets = MatchSetRepository.getMatchSets()
        if(matchSets != nil) {
            return matchSets!
        }
        return []
    }
    
    func addMatchSet(matchSet: MatchSet) -> Void {
        let isSuccess = MatchSetRepository.addMatchSet(matchSet)
        
        print(isSuccess ?? "")
    }
    
    func updateMatch(matchSet: MatchSet) -> Void {
        let isSuccess = MatchSetRepository.updateMatchSet(matchSet)
        
        print(isSuccess ?? "")
    }
    
    func deleteMatch(id: UUID) -> Void {
        MatchSetRepository.deleteMatchSet(matchSetId: id)
    }
}

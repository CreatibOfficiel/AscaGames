//
//  MatchTypeService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import Foundation

class MatchTypeService {
        
    func getMatchTypes() -> [MatchType] {
        let matchTypes = MatchTypeRepository.getMatchTypes()
        if(matchTypes != nil) {
            return matchTypes!
        }
        return []
    }
    
    func addMatchType(matchType: MatchType) -> Void {
        let isSuccess = MatchTypeRepository.addMatchType(matchType)
        
        print(isSuccess ?? "")
    }
    
    func updateMatchType(matchType: MatchType) -> Void {
        let isSuccess = MatchTypeRepository.updateMatchType(matchType)
        
        print(isSuccess ?? "")
    }
    
    func deleteMatchType(id: Int64) -> Void {
        MatchTypeRepository.deleteMatchType(matchTypeId: id)
    }
}

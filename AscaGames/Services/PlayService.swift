//
//  PlayService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import Foundation

class PlayService {
    
    func getPlays() -> [Play] {
        let plays = PlayRepository.getPlays()
        if(plays != nil) {
            return plays!
        }
        return []
    }
    
    func addPlay(play: Play) -> Void {
        let isSuccess = PlayRepository.addPlay(play)
        
        print(isSuccess ?? "")
    }
    
    func updatePlay(play: Play) -> Void {
        let isSuccess = PlayRepository.updatePlay(play)
        
        print(isSuccess ?? "")
    }
    
    func deleteUser(idUser: UUID, idMatch: UUID) -> Void {
        PlayRepository.deletePlay(UserId: idUser, MatchId: idMatch)
    }
}

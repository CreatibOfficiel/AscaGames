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
}


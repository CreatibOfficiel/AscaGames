//
//  UserService.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import Foundation

class UserService {
    
    private var userList = [User(id: UUID(), firstName: "Jean", lastName: "Dupont3")]
    
    func getUsers() -> [User] {
        var users = UserRepository.getUsers()
        if(users != nil) {
            return users!
        }
        return []
    }
    
    func addUser(user: User) -> Void {
        userList.append(user)
    }
}


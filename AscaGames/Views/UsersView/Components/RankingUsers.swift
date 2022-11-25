//
//  RankingUsers.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import SwiftUI

struct RankingUsers: View {
    
    @State var data : Array<User>
    
    var switchIsRanking: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    
                }.frame(width: 300, height: 60)
                .background(theme.customYellow)
                
                ScrollView {
                    Spacer()
                    ForEach(data, id: \.self) { u in
                        let myUser = User(idUser: u.idUser, firstName: u.firstName, lastName: u.lastName, elo: u.elo)
                        EditUserLine(user: myUser, updateUser: updateUser, deleteUser: updateUser).padding(10)
                    }
                    Spacer()
                }
                
                VStack {
                    Button(action: switchIsRanking) {
                        Text("U S E R S   L I S T")
                            .padding()
                            .frame(width: 250)
                            .background(theme.customYellow)
                            .clipShape(Capsule())
                            .overlay(
                                RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                            )
                    }.padding([.top,.bottom], 10)
                }
                .frame(maxWidth: .infinity)
                .background(theme.customYellow)
            }.frame(width: 300, height: 500)
            .border(theme.customYellow, width: 5)
        }
    }
    
    func addUser() -> Void {
        let newUser = User(idUser: UUID(), firstName: "Jean", lastName: "Dupont4", elo: 1500)
        UserService().addUser(user: newUser)
        data.append(newUser)
    }
    
    func updateUser(user: User) -> Void {
        
    }
}

//
//  RankingUsers.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import SwiftUI

struct RankingUsers: View {
    
    @Binding var title : String
    @State var data : Array<User>
    
    var body: some View {



        ScrollView {
            VStack {
                VStack {
                    Text(title)
                }.frame(width: 300, height: 60)
                .background(theme.customYellow)
                
                ScrollView {
                    
                    
                    Spacer()

                    ForEach(data, id: \.self) { u in
                        let myUser = User(id: u.id, firstName: u.firstName, lastName: u.lastName)
                        EditUserLine(user: myUser).padding(10)
                    }
                    Spacer()

                }
                Button(action: addUser) {
                    Text("Button")
                        .frame(width: 300, height: 30)
                        .background(theme.customYellow)
                }
            }.frame(width: 300, height: 500)
                .border(theme.customYellow, width: 5)
        }
    }
    
    func addUser() -> Void {
        let newUser = User(id: UUID(), firstName: "Jean", lastName: "Dupont4")
        UserService().addUser(user: newUser)
        data.append(newUser)
    }
}

//
//  CustomTable.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI
import CoreData

struct ModifyUsers: View {
    
    @Binding var title : String
    @State var data : Array<User>
    @State var refreshParent: () -> Void


    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text(title)
                }.frame(width: 300, height: 60)
                .background()
                
                ScrollView {
                    Spacer()
                    ForEach(data, id: \.self) { u in
                        let myUser = User(idUser: u.idUser, firstName: u.firstName, lastName: u.lastName, elo: 1500)
                        EditUserLine(user: myUser, updateUser: updateUserAndRefreshView, deleteUser: deleteUserAndRefreshView).padding(10)
                    }
                    Spacer()
                }
                
                VStack {
                    NavigationLink(destination: AddUserView(refreshView: addUserAndRefreshView)) {
                        Text("+   N E W   U S E R")
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
    
    func deleteUserAndRefreshView(user: User) -> Void {
        data.removeAll(where: { user.idUser == $0.idUser })
        refreshParent()
    }
    
    func updateUserAndRefreshView(user: User) -> Void {
        var index = data.firstIndex(where: { user.idUser == $0.idUser })
        data[index!] = user
        refreshParent()
    }
    
    func addUserAndRefreshView(user: User) -> Void {
        data.append(user)
        refreshParent()
    }
}

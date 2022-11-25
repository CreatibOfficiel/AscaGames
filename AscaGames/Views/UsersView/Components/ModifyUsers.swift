//
//  CustomTable.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI
import CoreData

struct ModifyUsers: View {
    
    @State var data : Array<User>
    @State private var searchText = ""
    
    var switchIsRanking: () -> Void
    @State var refreshParent: () -> Void


    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Spacer(minLength: 5)
                        HStack (alignment: .center, spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                            TextField ("", text: $searchText).foregroundColor(.white)
                                .placeholder(when: self.searchText.isEmpty) {
                                    Text("Search").foregroundColor(.white)
                                }
                        }.padding([.top,.bottom,.leading], 10)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(.white, style: StrokeStyle(lineWidth: 1.0)))
                        Spacer(minLength: 5)
                    }
                }.frame(width: 300, height: 60)
                    .background(theme.customYellow)
                
                ScrollView {
                    NavigationLink(destination: AddUserView(refreshView: addUserAndRefreshView)) {
                        HStack () {
                            Image(systemName: "person.badge.plus.fill")
                                .foregroundColor(.white)
                                .padding(5)
                            Text("Add a new user").foregroundColor(.white)
                        }.frame(alignment: .leading)
                    }
                    
                    Spacer()
                    ForEach(data, id: \.self) { u in
                        let myUser = User(idUser: u.idUser, firstName: u.firstName, lastName: u.lastName, elo: u.elo)
                        EditUserLine(user: myUser, updateUser: updateUserAndRefreshView, deleteUser: deleteUserAndRefreshView).padding(10)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Button(action: switchIsRanking) {
                        Text("R A N K E D   L I S T")
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
    
    var searchResults: [User] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.firstName.contains(searchText) }
        }
    }
    
    func deleteUserAndRefreshView(user: User) -> Void {
        data.removeAll(where: { user.idUser == $0.idUser })
        refreshParent()
    }
    
    func updateUserAndRefreshView(user: User) -> Void {
        let index = data.firstIndex(where: { user.idUser == $0.idUser })
        data[index!] = user
        refreshParent()
    }
    
    func addUserAndRefreshView(user: User) -> Void {
        data.append(user)
        refreshParent()
    }
}

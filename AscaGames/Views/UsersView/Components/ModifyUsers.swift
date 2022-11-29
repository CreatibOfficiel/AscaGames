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
    @State var searchData: Array<User>
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
                                .onChange(of: searchText, perform: filterData)
                        }.padding([.top,.bottom,.leading], 10)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(.white, style: StrokeStyle(lineWidth: 1.0)))
                        Spacer(minLength: 5)
                    }.padding(10)
                }.frame(width: 350, height: 60)
                    .background(
                       Rectangle()
                        .fill(theme.customYellow)
                        .padding(.bottom, 20)
                        .cornerRadius(20)
                        .padding(.bottom, -20)
                    )
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
                    ForEach(searchData, id: \.self) { u in
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
                .background(
                   Rectangle()
                    .fill(theme.customYellow)
                    .padding(.top, 50)
                    .cornerRadius(50)
                    .padding(.top, -50)
                )
            }.frame(width: 350, height: 550)
            .overlay(
               RoundedRectangle(cornerRadius: 50)
                   .stroke(theme.customYellow, lineWidth: 10)
            )
            
        }
    }
    
    var searchResults: [User] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.firstName.contains(searchText) }
        }
    }
    
    func filterData(_: String) -> Void {
        if(searchText.isEmpty) {
            searchData = data
        } else {
            searchData = data.filter { $0.firstName.contains(searchText)}
        }
    }
    
    func deleteUserAndRefreshView(user: User) -> Void {
        data.removeAll(where: { user.idUser == $0.idUser })
        searchData.removeAll(where: { user.idUser == $0.idUser })

        refreshParent()
    }
    
    func updateUserAndRefreshView(user: User) -> Void {
        let index = data.firstIndex(where: { user.idUser == $0.idUser })
        data[index!] = user
        searchData[index!] = user
        refreshParent()
    }
    
    func addUserAndRefreshView(user: User) -> Void {
        data.append(user)
        searchData.append(user)
        refreshParent()
    }
}

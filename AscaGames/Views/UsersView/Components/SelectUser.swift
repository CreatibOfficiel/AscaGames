//
//  SelectUser.swift
//  AscaGames
//
//  Created by Thibaud on 29/11/2022.
//

import SwiftUI

struct SelectUser: View {
    
    @State var data : Array<User>
    @State var searchData: Array<User>
    @State private var searchText = ""
    
    @State var listOfUsersSelected: [User] = []
    @State var updateUserSelected: (User) -> Void
    
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
                    .background(theme.customYellow)
                
                ScrollView {
                    Spacer()
                    ForEach(searchData, id: \.self) { u in
                        let myUser = User(idUser: u.idUser, firstName: u.firstName, lastName: u.lastName, elo: u.elo)
                        SelectUserLine(selectedUser: myUser, listOfUsersSelected: listOfUsersSelected, updateUserSelected: updateUserSelected)
                    }
                    Spacer()
                }
            }.frame(width: 350, height: 550)
                .border(theme.customYellow, width: 5)
                .padding(.bottom, 20)
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
}

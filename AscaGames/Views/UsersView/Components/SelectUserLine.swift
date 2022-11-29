//
//  SelectUserLine.swift
//  AscaGames
//
//  Created by Thibaud on 29/11/2022.
//

import SwiftUI

struct SelectUserLine: View {
    
    @State var selectedUser : User
    
    @State var updateUserSelected: (User) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill").foregroundColor(theme.customYellow)
                Text(selectedUser.firstName).foregroundColor(theme.customYellow)
                Text(selectedUser.lastName.prefix(1) + ".").foregroundColor(theme.customYellow)
                Spacer()
                Button(action: selectUser) {
                    Text("SELECT")
                        .padding()
                        .frame(width: 95, height: 30)
                        .background(theme.customYellow)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                        )
                }
            }.padding([.trailing, .leading], 20)
            Divider().frame(width: 320, height: 2).overlay(.white)
        }
    }
    
    func selectUser() -> Void {
        updateUserSelected(selectedUser)
    }
}

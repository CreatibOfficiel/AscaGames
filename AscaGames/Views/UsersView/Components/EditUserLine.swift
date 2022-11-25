//
//  EditUserLine.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct EditUserLine: View {
    @State var user: User
    @State var updateUser: (User) -> Void
    @State var deleteUser: (User) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill").foregroundColor(theme.customYellow)
                Text(user.firstName).foregroundColor(theme.customYellow)
                Text(user.lastName.prefix(1) + ".").foregroundColor(theme.customYellow)
                Spacer()
                NavigationLink(destination: ModifyUserView(user: user, updateUser: updateUser, deleteUser: deleteUser)) {
                    Image(systemName: "pencil.circle.fill").foregroundColor(theme.customYellow)
                }
            }.padding(5)
            Divider().background(.white)
        }
    }
}

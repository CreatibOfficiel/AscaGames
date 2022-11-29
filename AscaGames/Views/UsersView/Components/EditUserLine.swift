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
                    Image(systemName: "pencil.circle.fill").foregroundColor(theme.customYellow).font(.system(size: 32))
                }
            }.padding(.leading, 5)
             .padding(.trailing, 5)
             .padding(.bottom, -5)
             .padding(.top, -5)
            Divider().frame(width: 320, height: 2).overlay(.white)
        }
    }
}

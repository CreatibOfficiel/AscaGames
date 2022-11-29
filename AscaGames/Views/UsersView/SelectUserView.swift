//
//  SelectUserView.swift
//  AscaGames
//
//  Created by Thibaud on 29/11/2022.
//

import SwiftUI

struct SelectUserView: View {
    
    @State var updateUserSelected: (User) -> Void
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("PING PONG")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(theme.customYellow)
                Divider().frame(width: 230, height: 2).overlay(.white)
                Text("SELECT USER").foregroundColor(.white)
                Spacer().frame(height: 60)
                
                SelectUser(data: UserService().getUsers(), searchData: UserService().getUsers(), updateUserSelected: closeView(user:))
            }
            .frame(width: 1000)
            .background(Color.black)
        }
    }
    
    func closeView(user:User) -> Void {
        updateUserSelected(user)
        self.presentationMode.wrappedValue.dismiss()
    }
}

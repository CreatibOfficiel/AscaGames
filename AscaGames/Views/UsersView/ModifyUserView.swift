//
//  ModifyUserView.swift
//  AscaGames
//
//  Created by Thibaud on 24/11/2022.
//

import SwiftUI

struct ModifyUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var user: User
    
    var body: some View {
        VStack(spacing: 0) {
            Text("PING PONG")
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(theme.customYellow)
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("MODIFY USER").foregroundColor(.white)
            
            Spacer().frame(height: 60)
            
            HStack {
                Spacer(minLength: 20)
                HStack (alignment: .center, spacing: 10) {
                    Image(systemName: "person.fill")
                        .foregroundColor(theme.customYellow)
                    TextField ("First Name", text: $user.firstName).foregroundColor(theme.customYellow)
            }.padding([.top,.bottom], 20)
                    .padding(.leading, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                Spacer(minLength: 20)
            }
            
            HStack {
                Spacer(minLength: 20)
                HStack (alignment: .center, spacing: 10) {
                    Image(systemName: "person.fill")
                        .foregroundColor(theme.customYellow)
                    TextField ("Last Name", text: $user.lastName).foregroundColor(theme.customYellow)
            }.padding([.top,.bottom], 20)
                    .padding(.leading, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                Spacer(minLength: 20)
            }.padding([.top,.bottom], 40)
            
            Button(action: save) {
                Text("S A V E")
                    .padding()
                    .frame(width: 250)
                    .background(theme.customYellow)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    )
            }.padding([.top,.bottom], 20)
            
            Button(action: delete) {
                Text("D E L E T E")
                    .padding()
                    .frame(width: 250)
                    .background(.red)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    )
            }
        }
        .frame(height: 1000)
        .background(Color.black)
    }
    
    func save() -> Void {
        if (user.firstName != "" && user.lastName != "") {
            UserService().updateUser(user: user)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func delete() -> Void {
        UserService().deleteUser(id: user.idUser)
        self.presentationMode.wrappedValue.dismiss()
    }
}


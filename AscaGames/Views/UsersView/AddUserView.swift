//
//  AddUserView.swift
//  AscaGames
//
//  Created by Thibaud on 24/11/2022.
//

import SwiftUI

struct AddUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var refreshView: (User) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text("PING PONG")
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(theme.customYellow)
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("ADD USER").foregroundColor(.white)
            
            Spacer().frame(height: 60)
            
            HStack {
                Spacer(minLength: 20)
                HStack (alignment: .center, spacing: 10) {
                    Image(systemName: "person.fill")
                        .foregroundColor(theme.customYellow)
                    TextField ("", text: $firstName).foregroundColor(theme.customYellow)
                        .placeholder(when: self.firstName.isEmpty) {
                            Text("First Name").foregroundColor(theme.customYellow)
                        }
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
                    TextField ("", text: $lastName).foregroundColor(theme.customYellow)
                        .placeholder(when: self.lastName.isEmpty) {
                            Text("Last Name").foregroundColor(theme.customYellow)
                        }
            }.padding([.top,.bottom], 20)
                    .padding(.leading, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                Spacer(minLength: 20)
            }.padding([.top,.bottom], 40)
            
            Button(action: createUser) {
                Text("C O N F I R M")
                    .padding()
                    .frame(width: 250)
                    .background(theme.customYellow)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    )
            }.padding([.top,.bottom], 20)
        }
        .frame(height: 1000)
        .background(Color.black)
    }
    
    func createUser() -> Void {
        if (self.firstName != "" && self.lastName != "") {
            let newUser: User = User(idUser: UUID(), firstName: self.firstName, lastName: self.lastName, elo: 1500)
            UserService().addUser(user: newUser)
            refreshView(newUser)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

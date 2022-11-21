//
//  EditUserLine.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct EditUserLine: View {
    @Binding var user: User
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill").foregroundColor(.white)
                Text(user.firstName).foregroundColor(.white)
                Text(user.lastName.prefix(1) + ".").foregroundColor(.white)
                Spacer()
                Image(systemName: "pencil.circle.fill").foregroundColor(.white)
                
            }.padding(5)
            Divider().background(.white)
            
        }

    }
}

struct EditUserLine_Previews: PreviewProvider {
    static var previews: some View {
        EditUserLine(user: .constant(User(id: UUID(), firstName: "FirstName", lastName: "LastName")))
    }
}

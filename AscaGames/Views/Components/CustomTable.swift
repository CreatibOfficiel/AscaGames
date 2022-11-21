//
//  CustomTable.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct CustomTable: View {
    
    @Binding var title : String
    
    @State var myUser = User(id: UUID(), firstName: "Jean", lastName: "Dupont")
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text(title)
                }.frame(width: 300, height: 60)
                .background(.yellow)
                
                Spacer()

                EditUserLine(user: $myUser)
                Spacer()
                Text("Button")
                    .frame(width: 300, height: 30)
                    .background(.yellow)
            }.frame(width: 300, height: 500)
            .border(Color.yellow, width: 5)
            
        }
    }
}

struct CustomTable_Previews: PreviewProvider {
    static var previews: some View {
        CustomTable(title: .constant("title"))
    }
}

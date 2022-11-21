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
                .background(theme.customYellow)
                
                Spacer()

                EditUserLine(user: $myUser).padding(10)
                Spacer()
                Text("Button")
                    .frame(width: 300, height: 30)
                    .background(theme.customYellow)
            }.frame(width: 300, height: 500)
                .border(theme.customYellow, width: 5)
        }
    }
    
    public func _apply(to shape: inout SwiftUI._ShapeStyle_Shape) {
        Color.red._apply(to: &shape)  // << here !!
    }
}

struct CustomTable_Previews: PreviewProvider {
    static var previews: some View {
        CustomTable(title: .constant("title"))
    }
}

//
//  UsersView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct UsersView: View {
    
    var data: Array<User>
    @State var title = "Users"
    
    init() {
        data = UserService().getUsers()
    }
    
    
    var body: some View {
        VStack {
            Text("Ping Pong").foregroundColor(.white)
            Text("All Users")
            Spacer().frame(height: 60)
            
            CustomTable(title: $title, data: data)
        }
        .frame(width: 1000)
        .background(Color.black)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

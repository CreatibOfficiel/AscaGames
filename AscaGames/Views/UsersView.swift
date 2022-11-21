//
//  UsersView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct UsersView: View {
    var body: some View {
        VStack {
            Text("Ping Pong")
            Text("All Users")
            
            CustomTable()
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

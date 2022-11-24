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
    @State var titleRanking = "Ranking"
    @State var isRanking = true
    
    init() {
        data = UserService().getUsers()
    }
    
    
    var body: some View {
        VStack {
            Text("Ping Pong").foregroundColor(.white)
            Text("All Users")
            Spacer().frame(height: 60)
            
            if(isRanking){
                RankingUsers(title: $titleRanking, data: data)
            } else {
                ModifyUsers(title: $title, data: data)
            }
            Button(action: swap) {
                Text("SwAP ME")
            }
        }
        .frame(width: 1000)
        .background(Color.black)
    }
    
    func swap() -> Void {
        isRanking = !isRanking
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

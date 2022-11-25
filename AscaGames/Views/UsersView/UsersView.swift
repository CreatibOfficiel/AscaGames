//
//  UsersView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct UsersView: View {
    var tableView = UITableView()
    
    @State var data: Array<User>
    @State var dataStats: Array<UserStats>
    @State var title = "Users"
    @State var titleRanking = "Ranking"
    @State var isRanking = true
    
    init() {
        data = UserService().getUsers()
        dataStats = UserService().getUserStats()
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("PING PONG")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(theme.customYellow)
                Divider().frame(width: 230, height: 2).overlay(.white)
                Text(isRanking ? "USERS RANKING" : "EDIT USER").foregroundColor(.white)
                Spacer().frame(height: 60)
                
                if (isRanking) {
                    RankingUsers(data: dataStats, switchIsRanking: swap)
                } else {
                    ModifyUsers(data: data, searchData: data, switchIsRanking: swap, refreshParent: refreshView)
                }
            }
            .frame(width: 1000)
            .background(Color.black)
        }
    }
    
    func swap() -> Void {
        isRanking = !isRanking
    }
    
    func refreshView() -> Void {
        data = UserService().getUsers()
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

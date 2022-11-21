//
//  ContentView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = theme.customYellow
        
    }
    
    var body: some View {

        TabView {
            DashBoardView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            MatchesView().tabItem {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.red)
                Text("Matches")
            }
            UsersView().tabItem {
                Image(systemName: "person.3.fill")
                    .foregroundColor(.black)
                Text("Users")
            }
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

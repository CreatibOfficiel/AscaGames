//
//  ContentView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI


let customColor = UIColor()

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = customColor.hexStringToUIColor(hex: "FBBB3A")
    }
    
    var body: some View {
        TabView {
            DashBoardView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            MatchesView().tabItem {
                Image(systemName: "chart.bar.fill")
                    .renderingMode(.template)
                    .foregroundColor(.black)
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

//
//  MatchesView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct MatchesView: View {
    
    @State var data : Array<MatchHistory>
    
    init() {
        data = MatchService().getMatchHistory1v1()
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("PING PONG")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(theme.customYellow)
                Divider().frame(width: 230, height: 2).overlay(.white)
                Text("ALL MATCHES").foregroundColor(.white)
                Spacer().frame(height: 60)
                
                RankingMatches(data: data)
            }
            .frame(width: 1000)
            .background(Color.black)
        }
    }
}

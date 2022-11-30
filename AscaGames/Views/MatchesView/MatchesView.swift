//
//  MatchesView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct MatchesView: View {
    
    @State var data1v1 : Array<MatchHistory>
    @State var data2v2 : Array<MatchHistory>

    
    init() {
        data1v1 = MatchService().getMatchHistory1v1()
        data2v2 = MatchService().getMatchHistory2v2()
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
                
                RankingMatches(data1v1: data1v1, data2v2: data2v2, refreshParent: refreshView)
            }
            .frame(width: 1000)
            .background(Color.black)
        }
    }
    
    func refreshView() {
        data1v1 = MatchService().getMatchHistory1v1()
        data2v2 = MatchService().getMatchHistory2v2()
    }
}

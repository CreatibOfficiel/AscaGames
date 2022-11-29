//
//  MatchHistoryLine.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 29/11/2022.
//

import SwiftUI

struct MatchHistoryLine: View {
    @State var match: MatchHistory
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill").foregroundColor(.green)
            VStack {
                ForEach(match.teamWin, id: \.self) { m in
                    Text(m.firstName + " " + m.lastName.prefix(1) + ".").foregroundColor(theme.customYellow)
                }
            }
            Spacer()
            VStack {
                Text(" VS ").foregroundColor(.white).fontWeight(.heavy)
                Text(String(match.nbSets) + " sets").foregroundColor(.white)
            }
            Spacer()
            VStack {
                ForEach(match.teamLoose, id: \.self) { m in
                    Text(m.firstName + " " + m.lastName.prefix(1) + ".").foregroundColor(theme.customYellow)
                }
            }
            Image(systemName: "person.fill").foregroundColor(.red)
            
        }.padding(.leading ,10).padding(.trailing, 10)
    }
}

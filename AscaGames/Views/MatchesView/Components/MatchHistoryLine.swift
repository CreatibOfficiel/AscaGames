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
            
            match.teamWin.count > 1
            ? Image(systemName: "person.2.fill").foregroundColor(.green)
            : Image(systemName: "person.fill").foregroundColor(.green)
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
            match.teamLoose.count > 1
            ? Image(systemName: "person.2.fill").foregroundColor(.red)
            : Image(systemName: "person.fill").foregroundColor(.red)
        }.padding(.leading ,10).padding(.trailing, 10)
    }
}

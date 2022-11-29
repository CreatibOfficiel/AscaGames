//
//  RankingUserLine.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import SwiftUI

struct RankingUserLine: View {
    @State var userStat: UserStats
    @State var ranking: Int
    var body: some View {
        VStack {
            HStack {
                Text(" #\(ranking)").fontWeight(.heavy).foregroundColor(.white).padding(.leading, 5)
                Text(userStat.user.firstName).foregroundColor(theme.customYellow)
                Text(userStat.user.lastName.prefix(1) + ".").foregroundColor(theme.customYellow)
                Spacer()
                Group {
                    Text("\(userStat.wins)").foregroundColor(theme.customYellow)
                    + Text(" victoires / ").foregroundColor(.white)
                    + Text("\(userStat.matches)").foregroundColor(theme.customYellow)
                    + Text(" matchs").foregroundColor(.white)
                }.padding(.trailing, 5)
            }.padding(5)
            Divider().frame(width: 320, height: 2).overlay(.white)
        }
    }
}


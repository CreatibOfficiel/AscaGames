//
//  PingPongRules.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 29/11/2022.
//

import SwiftUI

struct PingPongRules: View {
    var body: some View {
        ScrollView {
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("Scoring").foregroundColor(.white).font(.title2)
            Text("\nA match is played best 3 of 5 games (or 4/7 or 5/9). For each game, the first player to reach 11 points wins that game, however a game must be won by at least a two point margin.\n\nA point is scored after each ball is put into play (not just when the server wins the point as in volleyball).\n\nThe edges of the table are part of the legal table surface, but not the sides.").foregroundColor(.white).padding(.bottom, 10)
            Divider().frame(width: 230, height: 2).overlay(.white)
            
            Text("Flow of the match").foregroundColor(.white).font(.title2)
            Text("Each player serves two points in a row and then switch server. However, if a score of 10-10 is reached in any game, then each server serves only one point and then the server is switched. After each game, the players switch side of the table. In the final game (ie 5th game), the players switch side again after either player reaches 5 points.").foregroundColor(.white)
            Divider().frame(width: 230, height: 2).overlay(.white)

            Text("Legal serve").foregroundColor(.white).font(.title2)
            Text("The ball must rest on an open hand palm. Then it must be tossed up at least 6 inches and struck so the ball first bounces on the server's side and then the opponent's side.\n\nIf the serve is legal except that it touches the net, it is called a let serve. Let serves are not scored and are reserved.").foregroundColor(.white)
            Divider().frame(width: 230, height: 2).overlay(.white)

        }.padding(10)
    }
}

struct PingPongRules_Previews: PreviewProvider {
    static var previews: some View {
        PingPongRules()
    }
}

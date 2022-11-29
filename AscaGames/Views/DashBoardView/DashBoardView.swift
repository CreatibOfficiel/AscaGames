//
//  DashBoardView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 21/11/2022.
//

import SwiftUI

struct DashBoardView: View {
    var body: some View {
        
        VStack(spacing: 0) {
            Text("PING PONG")
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(theme.customYellow)
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("RULES").foregroundColor(.white)
            Spacer().frame(height: 60)
            TabRules()
        }
        .frame(width: 1000)
        .background(Color.black)
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}

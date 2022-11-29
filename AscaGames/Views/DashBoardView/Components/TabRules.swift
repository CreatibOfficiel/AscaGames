//
//  TabRules.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 29/11/2022.
//

import SwiftUI

struct TabRules: View {
    
    @State var pingPong: Bool = true
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: swapMode) {
                        Text("Ping Pong")
                            .padding()
                            .foregroundColor(pingPong ? theme.customYellow : .white)
                            .frame(width: 100)
                            .background(pingPong ? .white : theme.customYellow)
                            .clipShape(Capsule())
                            .overlay(
                                RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: pingPong ? 0 : 2)
                            )
                    }.padding([.top,.bottom,.leading], 10)
                    
                    Spacer()
                    
                    Button(action: swapMode) {
                        Text("Baby foot")
                            .padding()
                            .foregroundColor(!pingPong ? theme.customYellow : .white)
                            .frame(width: 100)
                            .background(!pingPong ? .white : theme.customYellow)
                            .clipShape(Capsule())
                            .overlay(
                                RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: !pingPong ? 0 : 2)
                            )
                    }.padding([.top,.bottom,.trailing], 10)
                    
                }.frame(maxWidth: .infinity)
                 .background(theme.customYellow)
                
                pingPong ? PingPongRules() : nil
                !pingPong ? BabyFootRules() : nil
                
            }.frame(width: 350, height: 550)
             .border(theme.customYellow, width: 5)
        }
    }
    
    func swapMode() {
        pingPong = !pingPong
    }
}

struct TabRules_Previews: PreviewProvider {
    static var previews: some View {
        TabRules()
    }
}

//
//  AddMatchView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import SwiftUI

struct AddMatchView: View {
    
    @State var singleMatch : Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            Text("PING PONG")
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(theme.customYellow)
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("NEW MATCH").foregroundColor(.white)
            Spacer().frame(height: 60)
            
            HStack {
                Button(action: swapSingleMatch) {
                    Text("1 vs 1")
                        .padding()
                        .foregroundColor(singleMatch ? theme.customYellow : .white)
                        .frame(width: 100)
                        .background(singleMatch ? .white : theme.customYellow)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: singleMatch ? 0 : 2)
                        )
                }.padding([.top,.bottom,.leading], 10)
    
                Spacer()
                
                Button(action: swapDoubleMatch) {
                    Text("2 vs 2")
                        .padding()
                        .foregroundColor(singleMatch ? .white : theme.customYellow)
                        .frame(width: 100)
                        .background(singleMatch ? theme.customYellow : .white)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: singleMatch ? 2 : 0)
                        )
                }.padding([.top,.bottom,.trailing], 10)
            }.frame(width: 300, height: 80)
            
            Divider().frame(width: 230, height: 2).overlay(.white)
            
            
            
            
        }.frame(width: 1000, height: 1000)
        .background(Color.black)
    }
    
    func swapSingleMatch() -> Void {
        singleMatch = true
    }
    
    func swapDoubleMatch() -> Void {
        singleMatch = false
    }
}

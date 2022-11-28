//
//  AddMatchView.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 25/11/2022.
//

import SwiftUI

struct AddMatchUserView: View {
    
    @State var singleMatch : Bool = true
    
    @State var firstLeftPlayer : User = User(idUser: UUID(), firstName: "", lastName: "", elo: 0)
    @State var firstRightPlayer : User = User(idUser: UUID(), firstName: "", lastName: "", elo: 0)
    @State var secondLeftPlayer : User = User(idUser: UUID(), firstName: "", lastName: "", elo: 0)
    @State var secondRightPlayer : User = User(idUser: UUID(), firstName: "", lastName: "", elo: 0)
    
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
            
            Divider().frame(width: 230, height: 2).overlay(.white).padding([.bottom], 60)
            
            HStack {
                NavigationLink(destination: ContentView()) {
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "person.fill")
                            .foregroundColor(theme.customYellow)
                        Text(firstLeftPlayer.firstName).foregroundColor(theme.customYellow)
                    }
                    Spacer(minLength: 20)
                }.padding([.top,.bottom], 20)
                        .padding(.leading, 10)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                        .frame(width: 120, height: 30)
                
                Spacer().frame(width: 40)
                
                NavigationLink(destination: ContentView()) {
                    Spacer(minLength: 20)
                    HStack (alignment: .center, spacing: 10) {
                        Text(firstRightPlayer.firstName).foregroundColor(theme.customYellow)
                        Image(systemName: "person.fill")
                            .foregroundColor(theme.customYellow)
                    }
                }.padding([.top,.bottom], 20)
                        .padding(.trailing, 10)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                        .frame(width: 120, height: 30)
            }.padding([.bottom], 10)
            
            Text("VS").font(.custom("Poppins", size: 24).weight(.black)).foregroundColor(.white)
            
            if (!singleMatch) {
                HStack {
                    NavigationLink(destination: ContentView()) {
                        HStack (alignment: .center, spacing: 10) {
                            Image(systemName: "person.fill")
                                .foregroundColor(theme.customYellow)
                            Text(secondLeftPlayer.firstName).foregroundColor(theme.customYellow)
                        }
                        Spacer(minLength: 20)
                    }.padding([.top,.bottom], 20)
                            .padding(.leading, 10)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                            .frame(width: 120, height: 30)
                    
                    Spacer().frame(width: 40)
                    
                    NavigationLink(destination: ContentView()) {
                        Spacer(minLength: 20)
                        HStack (alignment: .center, spacing: 10) {
                            Text(secondRightPlayer.firstName).foregroundColor(theme.customYellow)
                            Image(systemName: "person.fill")
                                .foregroundColor(theme.customYellow)
                        }
                    }.padding([.top,.bottom], 20)
                            .padding(.trailing, 10)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                            .frame(width: 120, height: 30)
                }.padding([.top], 10)
            }
            
            NavigationLink(destination: AddMatchSetView()) {
                Text("N E X T")
                    .padding()
                    .frame(width: 250)
                    .background(theme.customYellow)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    )
            }.padding([.top], 80)
            
            
        }.frame(width: 1000 ,height: 1000)
        .disabled(canGoToNextStep())
        .background(Color.black)
    }
    
    func swapSingleMatch() -> Void {
        singleMatch = true
    }
    
    func swapDoubleMatch() -> Void {
        singleMatch = false
    }
    
    func canGoToNextStep() -> Bool {
        if (singleMatch) {
            return (firstLeftPlayer.firstName.isEmpty || firstRightPlayer.firstName.isEmpty)
        } else {
            return (firstLeftPlayer.firstName.isEmpty || firstRightPlayer.firstName.isEmpty || secondLeftPlayer.firstName.isEmpty || secondRightPlayer.firstName.isEmpty)
        }
    }
}

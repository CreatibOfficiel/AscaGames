//
//  AddMatchSetView.swift
//  AscaGames
//
//  Created by Thibaud on 28/11/2022.
//

import SwiftUI

struct AddMatchSetView: View {
    
    @State private var twoSets = true
    @State private var firstSetLeftScore = ""
    @State private var firstSetRightScore = ""
    @State private var secondSetLeftScore = ""
    @State private var secondSetRightScore = ""
    @State private var thirdSetLeftScore = ""
    @State private var thirdSetRightScore = ""
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text("PING PONG")
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(theme.customYellow)
            Divider().frame(width: 230, height: 2).overlay(.white)
            Text("NEW MATCH").foregroundColor(.white)
            Spacer().frame(height: 60)
            
            HStack {
                Text("2 sets").foregroundColor(.white)
                
                Toggle(isOn: $twoSets, label: {})
                    .padding()
                
                Text("3 sets").foregroundColor(.white)
            }.frame(width: 160)
            
            Divider().frame(width: 230, height: 2).overlay(.white).padding([.bottom], 60)
            
            HStack {
                HStack {
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "1.square.fill")
                            .foregroundColor(theme.customYellow)
                        TextField("", text: $firstSetLeftScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                    }
                    Spacer(minLength: 20)
                }.padding([.top,.bottom], 20)
                    .padding(.leading, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: 120, height: 30)
                
                Text("1st set").font(.custom("Poppins", size: 12).weight(.black)).foregroundColor(.white).padding()
                
                HStack {
                    Spacer(minLength: 20)
                    HStack (alignment: .center, spacing: 10) {
                        TextField("", text: $firstSetRightScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                        Image(systemName: "1.square.fill")
                            .foregroundColor(theme.customYellow)
                    }
                }.padding([.top,.bottom], 20)
                    .padding(.trailing, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: 120, height: 30)
            }.padding([.bottom], 40)
            
            HStack {
                HStack {
                    HStack (alignment: .center, spacing: 10) {
                        Image(systemName: "2.square.fill")
                            .foregroundColor(theme.customYellow)
                        TextField("", text: $secondSetLeftScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                    }
                    Spacer(minLength: 20)
                }.padding([.top,.bottom], 20)
                    .padding(.leading, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: 120, height: 30)
                
                Text("2nd set").font(.custom("Poppins", size: 12).weight(.black)).foregroundColor(.white).padding()
                
                HStack {
                    Spacer(minLength: 20)
                    HStack (alignment: .center, spacing: 10) {
                        TextField("", text: $secondSetRightScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                        Image(systemName: "2.square.fill")
                            .foregroundColor(theme.customYellow)
                    }
                }.padding([.top,.bottom], 20)
                    .padding(.trailing, 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: 120, height: 30)
            }.padding([.bottom], 40)
            
            if (twoSets) {
                HStack {
                    HStack {
                        HStack (alignment: .center, spacing: 10) {
                            Image(systemName: "3.square.fill")
                                .foregroundColor(theme.customYellow)
                            TextField("", text: $thirdSetLeftScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                        }
                        Spacer(minLength: 20)
                    }.padding([.top,.bottom], 20)
                        .padding(.leading, 10)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                        .frame(width: 120, height: 30)
                    
                    Text("3rd set").font(.custom("Poppins", size: 12).weight(.black)).foregroundColor(.white).padding()
                    
                    HStack {
                        Spacer(minLength: 20)
                        HStack (alignment: .center, spacing: 10) {
                            TextField("", text: $thirdSetRightScore).foregroundColor(theme.customYellow).keyboardType(.decimalPad)
                            Image(systemName: "3.square.fill")
                                .foregroundColor(theme.customYellow)
                        }
                    }.padding([.top,.bottom], 20)
                        .padding(.trailing, 10)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(theme.customYellow, style: StrokeStyle(lineWidth: 1.0)))
                        .frame(width: 120, height: 30)
                }.padding([.bottom], 40)
            }
            
            Button(action: createMatch) {
                Text("C O N F I R M")
                    .padding()
                    .frame(width: 250)
                    .background(theme.customYellow)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    )
            }.padding([.top], 20)
            .disabled(canCreateMatch())
        }.frame(width: 1000 ,height: 1000)
            .background(Color.black)
    }
    
    func createMatch() -> Void {
        print(canCreateMatch())
    }
    
    func canCreateMatch() -> Bool {
        if (twoSets) {
            return (firstSetLeftScore.isEmpty || firstSetRightScore.isEmpty || secondSetLeftScore.isEmpty || secondSetRightScore.isEmpty)
        } else {
            return (firstSetLeftScore.isEmpty || firstSetRightScore.isEmpty || secondSetLeftScore.isEmpty || secondSetRightScore.isEmpty || thirdSetLeftScore.isEmpty || thirdSetRightScore.isEmpty)
        }
    }
}

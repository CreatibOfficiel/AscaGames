//
//  AddMatchSetView.swift
//  AscaGames
//
//  Created by Thibaud on 28/11/2022.
//

import SwiftUI

struct AddMatchSetView: View {
    
    @Binding var shouldPopToRootView : Bool
    
    @State private var threeSets = true
    @State var teamsExist: Bool
    @State var refreshView: (MatchHistory) -> Void
    
    @State private var firstSetLeftScore = ""
    @State private var firstSetRightScore = ""
    @State private var secondSetLeftScore = ""
    @State private var secondSetRightScore = ""
    @State private var thirdSetLeftScore = ""
    @State private var thirdSetRightScore = ""
    
    @State var firstLeftPlayer : User
    @State var firstRightPlayer : User
    @State var secondLeftPlayer : User
    @State var secondRightPlayer : User
    
    @Environment(\.presentationMode) var presentationMode
    
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
                
                Toggle(isOn: $threeSets, label: {})
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
            
            if (threeSets) {
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
        if (!threeSets) {
            let firstBiggestNumber = max(firstSetLeftScore, firstSetRightScore)
            
            let set1 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 1, scoreTL: Int(firstSetLeftScore) ?? 0, scoreTR: Int(firstSetRightScore) ?? 0)
            let set2 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 2, scoreTL: Int(secondSetLeftScore) ?? 0, scoreTR: Int(secondSetRightScore) ?? 0)
            
            if (firstBiggestNumber == firstSetLeftScore) {
                // winner left team
                if (teamsExist) {
                    let matchHistory = MatchHistory(teamWin: [firstLeftPlayer, secondLeftPlayer], teamLoose: [firstRightPlayer, secondRightPlayer], nbSets: 2, matchType: "ping pong", sets: [set1, set2])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                } else {
                    let matchHistory = MatchHistory(teamWin: [firstLeftPlayer], teamLoose: [firstRightPlayer], nbSets: 2, matchType: "ping pong", sets: [set1, set2])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                }
            } else {
                // winner right team
                if (teamsExist) {
                    let matchHistory = MatchHistory(teamWin: [firstRightPlayer, secondRightPlayer], teamLoose: [firstLeftPlayer, secondLeftPlayer], nbSets: 2, matchType: "ping pong", sets: [set1, set2])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                } else {
                    let matchHistory = MatchHistory(teamWin: [firstRightPlayer], teamLoose: [firstLeftPlayer], nbSets: 2, matchType: "ping pong", sets: [set1, set2])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                }
            }
        } else {
            let firstBiggestNumber = max(firstSetLeftScore, firstSetRightScore)
            let secondBiggestNumber = max(secondSetLeftScore, secondSetRightScore)
            let thirdBiggestNumber = max(thirdSetLeftScore, thirdSetRightScore)
            
            let set1 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 1, scoreTL: Int(firstSetLeftScore) ?? 0, scoreTR: Int(firstSetRightScore) ?? 0)
            let set2 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 2, scoreTL: Int(secondSetLeftScore) ?? 0, scoreTR: Int(secondSetRightScore) ?? 0)
            let set3 = MatchSet(idMatchSet: UUID(), idMatch: UUID(), numSet: 3, scoreTL: Int(thirdSetLeftScore) ?? 0, scoreTR: Int(thirdSetRightScore) ?? 0)
            
            if (firstBiggestNumber == firstSetLeftScore &&
            secondBiggestNumber == secondSetLeftScore ||
            firstBiggestNumber == firstSetLeftScore &&
            thirdBiggestNumber == thirdSetLeftScore ||
            secondBiggestNumber == secondSetLeftScore &&
            thirdBiggestNumber == thirdSetLeftScore) {
                // winner left team
                if (teamsExist) {
                    let matchHistory = MatchHistory(teamWin: [firstLeftPlayer, secondLeftPlayer], teamLoose: [firstRightPlayer, secondRightPlayer], nbSets: 3, matchType: "ping pong", sets: [set1, set2, set3])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                } else {
                    let matchHistory = MatchHistory(teamWin: [firstLeftPlayer], teamLoose: [firstRightPlayer], nbSets: 3, matchType: "ping pong", sets: [set1, set2, set3])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                }
            } else {
                // winner right team
                if (teamsExist) {
                    let matchHistory = MatchHistory(teamWin: [firstRightPlayer, secondRightPlayer], teamLoose: [firstLeftPlayer, secondLeftPlayer], nbSets: 3, matchType: "ping pong", sets: [set1, set2, set3])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                } else {
                    let matchHistory = MatchHistory(teamWin: [firstRightPlayer], teamLoose: [firstLeftPlayer], nbSets: 3, matchType: "ping pong", sets: [set1, set2, set3])
                    MatchService().addMatchHistory(matchHistory: matchHistory)
                    sendMatchHistory(matchHistory: matchHistory)
                }
            }
        }
        
    }
    
    func sendMatchHistory(matchHistory: MatchHistory) {
        refreshView(matchHistory)
        self.shouldPopToRootView = false
    }
    
    func canCreateMatch() -> Bool {
        if (!threeSets) {
            return (firstSetLeftScore.isEmpty || firstSetRightScore.isEmpty || secondSetLeftScore.isEmpty || secondSetRightScore.isEmpty)
        } else {
            return (firstSetLeftScore.isEmpty || firstSetRightScore.isEmpty || secondSetLeftScore.isEmpty || secondSetRightScore.isEmpty || thirdSetLeftScore.isEmpty || thirdSetRightScore.isEmpty)
        }
    }
}

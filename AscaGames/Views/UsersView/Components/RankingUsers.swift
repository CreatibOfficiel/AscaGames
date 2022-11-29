//
//  RankingUsers.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 24/11/2022.
//

import SwiftUI

struct RankingUsers: View {
    
    @State var data : Array<UserStats>
    @State var singleMatch : Bool = true
    
    var switchIsRanking: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
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
                }.frame(width: 350, height: 80)
                .background(
                   Rectangle()
                    .fill(theme.customYellow)
                    .padding(.bottom, 20)
                    .cornerRadius(20)
                    .padding(.bottom, -20)
                )
                
                ScrollView {
                    Spacer()
                    ForEach(data, id: \.self) { u in
                        let userStat = UserStats(user: u.user, wins: u.wins, matches: u.matches)
                        RankingUserLine(userStat: userStat, ranking: data.firstIndex(of: userStat)! + 1)
                    }
                    Spacer()
                }
                
                VStack {
                    Button(action: switchIsRanking) {
                        Text("U S E R S   L I S T")
                            .padding()
                            .frame(width: 250)
                            .background(theme.customYellow)
                            .clipShape(Capsule())
                            .overlay(
                                RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                            )
                    }.padding([.top,.bottom], 10)
                }
                .frame(maxWidth: .infinity)
                .background(
                   Rectangle()
                    .fill(theme.customYellow)
                    .padding(.top, 50)
                    .cornerRadius(50)
                    .padding(.top, -50)
                )
            }.frame(width: 350, height: 550)
             .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(theme.customYellow, lineWidth: 10)
             )
        }
    }
    
    func swapSingleMatch() -> Void {
        singleMatch = true
    }
    
    func swapDoubleMatch() -> Void {
        singleMatch = false
    }
    
    func updateUser(user: User) -> Void {
        
    }
}

import SwiftUI

struct RankingMatches: View {
    
    @State var data1v1 : Array<MatchHistory>
    @State var data2v2 : Array<MatchHistory>
    @State var singleMatch : Bool = true
    @State var refreshParent: () -> Void
    @State var isActive: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: swapMatchMode) {
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
                    
                    Button(action: swapMatchMode) {
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
                    if(singleMatch){
                        ForEach(data1v1, id: \.self) { u in
                            MatchHistoryLine(match:u)
                            Divider().frame(width: 290, height: 2).overlay(.white)
                        }
                    } else {
                        ForEach(data2v2, id: \.self) { u in
                            MatchHistoryLine(match:u)
                            Divider().frame(width: 290, height: 2).overlay(.white)
                        }
                    }

                    Spacer()
                }
                
                VStack {
                    NavigationLink(
                        destination: AddMatchUserView(rootIsActive: self.$isActive, refreshView:refreshView),
                        isActive: self.$isActive
                    ) {
                        Text("+   N E W   M A T C H")
                            .padding()
                            .frame(width: 250)
                            .background(theme.customYellow)
                            .clipShape(Capsule())
                            .overlay(
                                RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                            )
                    }.isDetailLink(false)
                    .padding([.top,.bottom], 10)
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
    
    func refreshView(matchHistory: MatchHistory) {
        if(matchHistory.teamWin.count == 1) {
            data1v1.append(matchHistory)
        } else {
            data2v2.append(matchHistory)
        }
    }
    
    func swapMatchMode() -> Void {
        singleMatch = !singleMatch
    }
}

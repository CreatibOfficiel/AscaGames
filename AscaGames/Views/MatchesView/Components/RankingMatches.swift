import SwiftUI

struct RankingMatches: View {
    
    @State var data : Array<Match>
    @State var singleMatch : Bool = true
    
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
                .background(theme.customYellow)
                
                ScrollView {
                    Spacer()
                    ForEach(data, id: \.self) { u in
                        
                    }
                    Spacer()
                }
                
                VStack {
                    NavigationLink(destination: AddMatchUserView()) {
                        Text("+   N E W   M A T C H")
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
                .background(theme.customYellow)
            }.frame(width: 350, height: 550)
            .border(theme.customYellow, width: 5)
        }
    }
    
    func swapMatchMode() -> Void {
        singleMatch = !singleMatch
    }
}

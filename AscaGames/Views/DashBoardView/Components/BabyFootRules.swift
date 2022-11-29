//
//  BabyFootRules.swift
//  AscaGames
//
//  Created by Dylan Jacquet on 29/11/2022.
//

import SwiftUI

struct BabyFootRules: View {
    var body: some View {
        ScrollView {
            Text("The winner of a coin toss chooses either to kick-off first or to pick side. The other team gets the remaining option.\n\nThe kick-off is a serve from the midfield (5-bar). Subsequent kick-offs go to the team conceding the last goal.\n\nTo serve the ball, first ask if your opponent is “ready?”. When they say “ready”, you can begin your foosball match. The ball must touch two players and then you must wait one second before you pass or shoot.\n\nThe ball is ‘out’ if it leaves the playfield, defined as inside the cabinet or directly above it. Restart with a serve by the defender of the team that did not shoot the ball out.\n\nA ball is ‘dead’ if it can’t be reached by any player figure. If the ball goes dead between the 5-bars, restart with a kick-off by the team which conceded the last goal. If the ball goes dead behind a midfield bar, restart with a serve from the nearest defender.\n\nEach team is allowed 2 time outs per game of up to 30 seconds each. A time out can only be called by the team in possession of the ball and then only when the ball is not moving. Either team may call a time out when the ball is not in play (e.g. between balls or when the ball is dead or out).\n\nYou can score a goal with any player figure on any bar. If the ball enters the goal and bounces out it counts as a goal.\n\nIn doubles, the players in a team may only swap positions between balls or during a time out.\n\nThe penalty for spinning is a kick-off for your opponent. It’s a spin if the bar rotates more than 360˚ before or after striking the ball.\n\nYou can’t keep the ball for more than 10 seconds on the midfield bar, or more than 15 seconds on any other bar. The goalie and defence bars counts as one bar.\n\nIt’s illegal to bang the rods or move the table. The ball is given to the other team on the nearest rod forward from where the ball was when the jar occurred.\n\nIf the opponents cause the ball to wobble while it’s in your possession (e.g. by aggressive shaking of their bars) then your time limits start again.\n\nIt’s illegal to reach into the playing area without permission from the other team. If your team had the ball, the penalty is a kick-off to the other team; otherwise a goal is awarded to the other team.\n\nIf the ball is not moving, you can’t pass it from the midfield to the forward or from defence to midfield without first touching a second player figure.\n\nUnless otherwise stated, if you break a rule then the other team has the choice of a kick-off or to continue play from the current position. Other fouls include distracting an opponent and using bad language.").foregroundColor(.white)
        }.padding(10)
    }
}

struct BabyFootRules_Previews: PreviewProvider {
    static var previews: some View {
        BabyFootRules()
    }
}

//
//  AchievementsView.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 23/09/2021.
//
import SwiftUI

struct AchievementsView: View {
    @EnvironmentObject var state: StateController
    @ObservedObject var user: User
    var body: some View {
        VStack{
            List{
                Text("INCOMPLETE")
                    .bold()
                    .font(.title)
                ForEach(user.achievements, id: \.id) { achievement in
                    AchievementItem(achievement: achievement, showComplete: false)
                }
                .onDelete(perform: { indexSet in
                    user.achievements.remove(atOffsets: indexSet)
                })
                Text("")
                Text("COMPLETE")
                    .bold()
                    .font(.title)
                ForEach(user.achievements, id: \.id) { achievement in
                    AchievementItem(achievement: achievement, showComplete: true)
                }
                .onDelete(perform: { indexSet in
                    user.achievements.remove(atOffsets: indexSet)
                })
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(user: User(email: "", password: "", currentResort: "", achievements: []))
    }
}

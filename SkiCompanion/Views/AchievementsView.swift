//
//  AchievementsView.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 23/09/2021.
//
import SwiftUI

struct AchievementsView: View {
    @EnvironmentObject var state: StateController
    var body: some View {
        VStack{
            Text("\(state.currentUser.achievements[0].progress)")
            List{
                Text("INCOMPLETE")
                    .bold()
                    .font(.title)
                ForEach(state.currentUser.achievements, id: \.id) { achievement in
                    if !achievement.isComplete{
                        HStack{
                            Text(achievement.name)
                            Spacer()
                            Text("\(Int(achievement.progress))/\(achievement.goal)")
                            Text(achievement.type)
                        }
                    }
                }
//                .onDelete(perform: { indexSet in
//                    state.currentUser.achievements.remove(atOffsets: indexSet)
//                })
                Text("COMPLETE")
                    .bold()
                    .font(.title)
                ForEach(state.currentUser.achievements, id: \.id) { achievement in
                    if achievement.isComplete{
                        HStack{
                            Text(achievement.name)
                            Spacer()
                            Text("\(Int(achievement.progress))/\(achievement.goal)")
                            Text(achievement.type)
                        }
                    }
                }
//                .onDelete(perform: { indexSet in
//                    state.currentUser.achievements.remove(atOffsets: indexSet)
//                })
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}

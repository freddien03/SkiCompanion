//
//  AchievementItem.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 13/12/2021.
//

import SwiftUI

struct AchievementItem: View {
    @EnvironmentObject var state: StateController
    @ObservedObject var achievement: Achievement
    var body: some View {
        if !achievement.isComplete{
            HStack{
                Text(achievement.name)
                Spacer()
                Text("\(Int(achievement.progress))/\(achievement.goal)")
                Text(achievement.type)
            }
        }
    }
}

struct AchievementItem_Previews: PreviewProvider {
    static var previews: some View {
        AchievementItem(achievement: Achievement(name: "", type: "", goal: 0))
    }
}

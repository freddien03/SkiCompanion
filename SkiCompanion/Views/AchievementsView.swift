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
        List {
            ForEach(state.currentUser.achievements, id: \.id) { achievement in
                HStack{
                    Text(achievement.name)
                    Spacer()
                    Text(String(achievement.progress)+"/"+String(achievement.goal))
                    Text(achievement.type)
                }
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}

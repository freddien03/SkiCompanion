//
//  AchievementsExt.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 03/12/2021.
//

import Foundation

extension Achievement: Equatable {
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        return lhs.isComplete == rhs.isComplete || lhs.goal == rhs.goal || lhs.name == rhs.name || lhs.progress == rhs.progress || lhs.type == rhs.type
    }
}

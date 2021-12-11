//
//  Achievement.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation

class Achievement: ObservableObject {
    
    let name: String
    let type: String
    let id = UUID()
    let goal: Int
    var progress: Double = 0
    @Published var isComplete: Bool = false
    
    init(name: String, type: String, goal: Int) {
        self.name = name
        self.type = type
        self.goal = goal
    }
    
    // mark the achievement as completed when goal is reached
    func checkComplete(){
        if Int(floor(progress)) >= goal{
            isComplete = true
            progress = Double(goal)
        }
    }
}

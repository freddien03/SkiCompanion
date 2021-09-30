//
//  Achievement.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation

class Achievement {
    
    let name: String
    let type: String
    let goal: Int
    var id = UUID()
    var progress: Int = 0
    var isComplete: Bool = false
    
    init(name: String, type: String, goal: Int) {
        self.name = name
        self.type = type
        self.goal = goal
    }
    
    func checkComplete() -> Bool {
        if progress >= goal{
            isComplete = true
            return true
        }else{
            return false
        }
    }
}

//
//  User.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation

class User {
    let username: String
    let password: String
    var sessions: [Session] = []
    var achievements: [Achievement] = []
    var currrentResort: String
    
    init(username: String, password: String, currentResort: String, achievements: [Achievement]) {
        self.username = username
        self.password = password
        self.currrentResort = currentResort
        self.achievements = achievements
    }
    
    func authenticate(user: String, pass: String) -> Bool{
        if username == user && pass == password {
            return true
        }else{
            return false
        }
    }
    
//    func daysSkiing() {
//        if self.sessions.count != 0{
//            let fromDate = startOfDay(for: sessions[0])
//            let toDate = startOfDay(for: to)
//            let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
//
//                    return numberOfDays.day! + 1 // <1>
//        }else{
//            return 0
//        }
//    }
    
}

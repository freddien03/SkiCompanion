//
//  User.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import Firebase

class User {
    let email: String
    let password: String
    var sessions: [Session] = []
    var achievements: [Achievement] = []
    var currrentResort: String
    
    init(email: String, password: String, currentResort: String, achievements: [Achievement]) {
        self.email = email
        self.password = password
        self.currrentResort = currentResort
        self.achievements = achievements
    }
    
    func username() -> String{
        let emailList = email.split(separator: "@")
        return String(emailList[0])
    }
    
    func authenticate(email: String, pass: String) -> Bool{
        if email == self.email && pass == self.password {
            return true
        }else{
            return false
        }
    }
    
    func daysSkiing() -> Int{
        let calendar = Calendar.gregorian
        if self.sessions.count != 0{
            let fromDate = calendar.startOfDay(for: sessions[0])
            let toDate = calendar.startOfDay(for: Date())
            let numberOfDays = calendar.dateComponents([.day], from: fromDate, to: toDate)

            return numberOfDays.day! + 1
        }else{
            return 0
        }
    }
    
}

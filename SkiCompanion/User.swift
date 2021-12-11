//
//  User.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import Firebase

class User: ObservableObject {
    let email: String
    let password: String
    var sessions: [Session] = [] {
        didSet{
            for achievement in self.achievements{
                if !achievement.isComplete{
                    switch achievement.type {
                    case "km":
                        achievement.progress += (sessions[sessions.count-1].distance)/1000
                    case "mph":
                        if sessions[sessions.count-1].topSpeed > achievement.progress{
                            achievement.progress = sessions[sessions.count-1].topSpeed
                        }
                    default: ()
                    }
                }
                achievement.checkComplete()
            }
        }
    }
    @Published var achievements: [Achievement] = [] {
        willSet{
            objectWillChange.send()
        }
    }
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
        let calendar = Calendar(identifier: .gregorian)
        if self.sessions.count != 0{
            let fromDate = calendar.startOfDay(for: sessions[0].date)
            let toDate = calendar.startOfDay(for: Date())
            let numberOfDays = calendar.dateComponents([.day], from: fromDate, to: toDate)

            return numberOfDays.day! + 1
        }else{
            return 0
        }
    }
    
}

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
    
    init(username: String, password: String, currentResort: String) {
        self.username = username
        self.password = password
        self.currrentResort = currentResort
    }
    
    func authenticate(user: String, pass: String) -> Bool{
        if username == user && pass == password {
            return true
        }else{
            return false
        }
    }
    
}

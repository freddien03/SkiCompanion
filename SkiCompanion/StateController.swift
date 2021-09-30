//
//  StateController.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import CoreLocation

class StateController: ObservableObject {
    let locationHandler: LocationHandler = LocationHandler()
    var lastKnownLocation: String = ""
    var currentResort: String
    var currentUser: User
    
    init() {
        self.currentResort = "Verbier"
        self.currentUser = User(username: "admin", password: "admin", currentResort: self.currentResort)
        self.currentUser.achievements = [Achievement(name: "novice distance", type: "distance", goal: 100), Achievement(name: "novice speed", type: "speed", goal: 30)]
    }
    
}

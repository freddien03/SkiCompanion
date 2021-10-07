//
//  Session.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import CoreLocation

class Session {
    var locations: [CLLocation]
    let resort: String
    var topSpeed: Double = 0
    var elevation: Double = 0
    let date: Date
    
    init(locations: [CLLocation], resort: String, date: Date) {
        self.locations = locations
        self.resort = resort
        self.date = date
    }
    
    // used to keep the top speed up to date
    func updateTopSpeed(currentSpeed: Double) {
        if currentSpeed >= topSpeed {
            topSpeed = currentSpeed
        }
    }
}

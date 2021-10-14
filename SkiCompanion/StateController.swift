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
    var UserID: String = "" {
        didSet {
            print(UserID)
        }
    }
    
    init(currentResort: String, currentUser: User) {
        self.currentResort = currentResort
        self.currentUser = currentUser
    }
    
}

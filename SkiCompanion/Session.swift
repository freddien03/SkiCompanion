//
//  Session.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import CoreLocation
import MapKit

class Session: ObservableObject {
    var locations: [CLLocation]{
        didSet{
            self.updateTopSpeed()
            self.updateDistance()
            self.mapCoord = MKCoordinateRegion(center: locations[locations.count-1].coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        }
    }
    let resort: String
    var time: Int = 0
    var topSpeed: Double = 0
    var elevation: Double = 0
    var distance: Double = 0
    let date: Date
    @Published var mapCoord: MKCoordinateRegion = MKCoordinateRegion()
    
    init(locations: [CLLocation], resort: String, date: Date) {
        self.locations = locations
        self.resort = resort
        self.date = date
    }
    
    
    // used to keep the top speed up to date
    func updateTopSpeed() {
        var currentSpeed: Double = 0
        if self.locations.count >= 2{
            let lastLocations = [self.locations[self.locations.count-1], self.locations[self.locations.count-2]]
            let latDist = abs(lastLocations[0].coordinate.latitude - lastLocations[1].coordinate.latitude)
            let longDist = abs(lastLocations[0].coordinate.longitude - lastLocations[1].coordinate.longitude)
            let dist = sqrt(pow(latDist, 2) + pow(longDist, 2))
            currentSpeed = sqrt(pow(latDist, 2) + pow(longDist, 2))/lastLocations[0].timestamp.timeIntervalSince(lastLocations[1].timestamp)
        }
        print("speed \(currentSpeed)")
        if currentSpeed >= self.topSpeed {
            self.topSpeed = currentSpeed
        }
    }
    
    func updateDistance(){
        if self.locations.count > 1{
            let lastLocations = [self.locations[self.locations.count-1], self.locations[self.locations.count-2]]
            let latDist = abs(lastLocations[0].coordinate.latitude - lastLocations[1].coordinate.latitude)
            let longDist = abs(lastLocations[0].coordinate.longitude - lastLocations[1].coordinate.longitude)
            let dist = sqrt(pow(latDist, 2) + pow(longDist, 2))
            print("dist \(dist)")
            self.distance += dist
        }
    }
}

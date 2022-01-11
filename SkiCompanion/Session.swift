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
            // update metrics
            self.updateTopSpeed()
            self.updateDistance()
            self.updateElevation()
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
            let timeTaken = lastLocations[0].timestamp.timeIntervalSince(lastLocations[1].timestamp)
            currentSpeed = lastLocations[0].distance(from: lastLocations[1])/timeTaken
            currentSpeed = currentSpeed*2.236936
        }
        if currentSpeed >= self.topSpeed {
            self.topSpeed = currentSpeed
        }
    }
    
    func updateDistance(){
        if self.locations.count > 1{
            let lastLocations = [self.locations[self.locations.count-1], self.locations[self.locations.count-2]]
            let dist = lastLocations[0].distance(from: lastLocations[1])
            self.distance += dist
        }
    }
    
    func updateElevation(){
        var limits = [Double.greatestFiniteMagnitude, Double.zero]
        if self.locations.count >= 2{
            for location in self.locations{
                if location.altitude < limits[0] {
                    limits[0] = location.altitude
                }
                if location.altitude > limits[1]{
                    limits[1] = location.altitude
                }
            }
            self.elevation = limits[1] - limits[0]
        }
    }
}

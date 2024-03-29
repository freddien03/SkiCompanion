//
//  SessionView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI
import Firebase
import MapKit

import CoreLocation

struct SessionView: View {
    @State private var currentSession: Session? = nil
    @EnvironmentObject var state: StateController
    @State private var isSession = false
    @State private var progressTime = 0
    @State private var isRunning = false
    @State private var mapCoord: MKCoordinateRegion = MKCoordinateRegion()
//    update time based on time progressed
    var hours: Int {
        progressTime/3600
    }
    var minutes: Int {
        (progressTime % 3600) / 60
    }
    var seconds: Int {
        progressTime % 60
    }
    @State private var timer: Timer?
    var body: some View {
        VStack {
            Text("\(hours):\(minutes):\(seconds)")
                .font(.system(size: 50))
                .bold()
                .padding()
//            display session statistics if there is a session
            if let session = currentSession {
                HStack{
                    Text("Distance:")
                        .padding()
                    Spacer()
                    if session.distance >= 1000{
                        Text("\(String(format: "%.2f", session.distance/1000)) km")
                            .padding()
                    }else{
                        Text("\(Int(session.distance)) m")
                            .padding()
                    }
                }
                HStack{
                    Text("Top Speed:")
                        .padding()
                    Spacer()
                    Text("\(Int(session.topSpeed)) mph")
                        .padding()
                }
                HStack{
                    Text("Elevation:")
                        .padding()
                    Spacer()
                    Text("\(Int(session.elevation)) m")
                        .padding()
                }
            }
            
            HStack{
//                start button
                Button(action: {
//                    create timer, request and update location every second
                    state.locationRecieved = false
                    state.getLocation()
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                        progressTime += 1
                        if let currentSession = currentSession{
                            if state.lastKnownLocation != CLLocation(latitude: 0, longitude: 0) && state.locationRecieved {
                                state.locationRecieved = false
                                state.getLocation()
                                currentSession.locations.append(state.lastKnownLocation)
                                mapCoord = MKCoordinateRegion(center: currentSession.locations[currentSession.locations.count-1].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                            }
                        }
                    })
                    isSession.toggle()
                    isRunning.toggle()
                    currentSession = Session(locations: [], resort: state.currentResort, date: Date())
                }){
                    if !isSession{
                        Text("Start")
                    }
                }
//                pause/resume button
                if isSession{
                    Button(action: {
                        if isRunning{
                            timer?.invalidate()
                        }else{
//                    create timer, request and update location every second
                            state.locationRecieved = false
                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                                progressTime += 1
                                state.getLocation()
                                if let currentSession = currentSession{
                                    if state.lastKnownLocation != CLLocation(latitude: 0, longitude: 0) && state.locationRecieved {
                                        state.locationRecieved = false
                                        state.getLocation()
                                        currentSession.locations.append(state.lastKnownLocation)
                                        mapCoord = MKCoordinateRegion(center: currentSession.locations[currentSession.locations.count-1].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                                    }
                                }
                            })
                        }
                        isRunning.toggle()
                    }){
                        if isRunning{
                            Text("Pause")
                        }else{
                            Text("Resume")
                        }
                    }
                    .padding()
                }
                
//                stop button
                if isSession {
                    Button("Stop", action: {
                        timer?.invalidate()
                        isRunning = false
                        isSession = false
                        if let session = currentSession {
                            session.time = progressTime
                            state.currentUser.sessions.append(session)
                            currentSession = nil
                        }
                        progressTime = 0
                        // reset location
                        state.lastKnownLocation = CLLocation(latitude: 0, longitude: 0)
                        
                        let db = Firestore.firestore()
                        db.collection("users").document(state.UserID).setData([
                            "currentResort": state.currentResort,
                            "email": state.currentUser.email,
                            "password": state.currentUser.password], merge: true)
                        db.collection("users").document(state.UserID).collection("Achievements")
                    })
                    .padding()
                }
            }
            .padding()
            
//            display map if there is a session
            if let session = currentSession {
                if session.locations.count != 0{
                    Map(coordinateRegion: $mapCoord, showsUserLocation: true)
                }
            }
        }
        .onAppear(perform: {
            state.requestAccessToLocationData()
        })
        
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}

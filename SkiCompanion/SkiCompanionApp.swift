//
//  SkiCompanionApp.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 16/09/2021.
//

import SwiftUI

@main
struct SkiCompanionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SignUpView()
                .environmentObject(StateController(currentResort: "Verbier", currentUser: User(username: "admin", password: "admin", currentResort: "Verbier", achievements: [Achievement(name: "Novice Distance", type: "km", goal: 100), Achievement(name: "Novice Speed", type: "mph", goal: 30)])))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

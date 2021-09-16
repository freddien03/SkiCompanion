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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

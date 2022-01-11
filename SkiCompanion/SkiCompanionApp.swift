//
//  SkiCompanionApp.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 16/09/2021.
//

import SwiftUI
import Firebase

@main
struct SkiCompanionApp: App {
  @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
  var body: some Scene {
    WindowGroup {
      SignUpView()
        .environmentObject(StateController(currentResort: "Verbier", currentUser: User(email: "test@admin.com", password: "password", currentResort: "Verbier", achievements: [Achievement(name: "Novice Distance", type: "km", goal: 100), Achievement(name: "Novice Speed", type: "mph", goal: 30)]))
)
    }
  }
}

//StateController(currentResort: "Verbier", currentUser: User(email: "admin@admin.com", password: "password", currentResort: "Verbier", achievements: [Achievement(name: "Novice Distance", type: "km", goal: 100), Achievement(name: "Novice Speed", type: "mph", goal: 30)]))

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}



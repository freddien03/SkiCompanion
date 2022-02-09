//
//  ProfileView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var state: StateController
    @State private var showConfirmation = false
    @Binding var loggedIn: Bool
    var body: some View {
        VStack{
            Spacer()
            Text(state.currentUser.username() + "'s Profile")
                .font(.title)
                .bold()
                .padding()
            Text("Current Resort: "+state.currentResort)
                .padding()
            Text("Days Skiing: \(state.currentUser.daysSkiing())")
//            NavigationLink(destination: ResortView()){
//                Text("Change Resort")
//            }
//            .padding()
            Spacer()
            if #available(iOS 15.0, *) {
                Button("Log Out") {
                    showConfirmation = true
                }
                .confirmationDialog("Log Out?", isPresented: $showConfirmation, titleVisibility: .visible) {
                    Button("Confirm") {
                        let firebaseAuth = Auth.auth()
                        do {
                          try firebaseAuth.signOut()
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                        state.UserID = ""
                        loggedIn = false
                    }
                }
                .padding()
            } else {
                Button("Log Out") {
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                    state.UserID = ""
                    loggedIn = false
                }
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(loggedIn: .constant(false))
    }
}

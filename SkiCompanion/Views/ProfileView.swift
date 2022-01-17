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
    @Binding var loggedOut: Bool
    var body: some View {
        VStack{
            Text(state.currentUser.username() + "'s Profile")
                .font(.title)
                .bold()
                .padding()
            Text("Current Resort: "+state.currentResort)
            Text("Days Skiing: \(state.currentUser.daysSkiing())")
//            NavigationLink(destination: ResortView()){
//                Text("Change Resort")
//            }
//            .padding()
            
            Button("Log Out") {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                state.UserID = ""
                loggedOut = true
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(loggedOut: .constant(false))
    }
}

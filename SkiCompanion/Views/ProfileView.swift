//
//  ProfileView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var state: StateController
    var body: some View {
        VStack{
            Text(state.currentUser.username() + "'s Profile")
                .font(.title)
                .bold()
                .padding()
            Text("Current Resort: "+state.currentResort)
            Text("Days Skiing: \(state.currentUser.daysSkiing())")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

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
                .padding()
            Text("Current Resort: "+state.currentResort)
            Text("Days Skiing: ")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

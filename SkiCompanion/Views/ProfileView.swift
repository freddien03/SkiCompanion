//
//  ProfileView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            Text("Profile")
        }.navigationBarBackButtonHidden(true)
        .navigationTitle("Ski App")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

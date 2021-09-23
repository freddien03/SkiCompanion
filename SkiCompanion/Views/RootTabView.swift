//
//  RootTabView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            WeatherView()
                .tabItem {
                    Image(systemName: "cloud.sun")
                }
            SessionView()
                .tabItem {
                    Text("Start Session")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
            ResortView()
                .tabItem {
                    Text("Change Resort")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

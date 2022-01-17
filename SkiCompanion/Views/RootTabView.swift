//
//  RootTabView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct RootTabView: View {
    @EnvironmentObject var state: StateController
//    @Binding var loggedOut: Bool = .constant(false)!
    @State var loggedOut: Bool = false
    var body: some View {
        NavigationLink(
            destination: SignUpView(), isActive: $loggedOut, label: {
                EmptyView()
            })
            TabView {
                ProfileView(loggedOut: $loggedOut)
                    .tabItem {
                        VStack{
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                    }
                AchievementsView(user: state.currentUser)
                    .tabItem {
                        VStack{
                            Image(systemName: "star.circle")
                            Text("Achievements")
                        }
                    }
                SessionView()
                    .tabItem {
                        VStack{
                            Image(systemName: "plus.viewfinder")
                            Text("Start Session")
                                .bold()
                        }
                    }
                WeatherView()
                    .tabItem {
                        VStack{
                            Image(systemName: "cloud.sun")
                            Text("weather")
                        }
                    }
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

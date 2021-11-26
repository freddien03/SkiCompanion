//
//  RootTabView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        NavigationView{
            TabView {
                ProfileView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                    }
                AchievementsView()
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
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

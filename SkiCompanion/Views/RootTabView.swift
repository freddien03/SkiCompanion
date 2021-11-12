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
                ResortView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
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
                ProfileView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
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

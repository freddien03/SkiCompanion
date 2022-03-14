//
//  WeatherView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 20/09/2021.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var state: StateController
    var body: some View {
        if let forecast = state.latestForecast{
            VStack{
                Text(state.currentResort)
                    .font(.title)
                    .bold()
                    .padding()
                HStack{
//                    description
                    Text(forecast.midStats.desc)
                        .padding()
//                    icon
                    Image(String(forecast.midStats.image.prefix(forecast.midStats.image.count - 4)))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/12)
                        .padding()
                    Text(String(forecast.baseStats.temp ?? 0) + "°C")
                        .padding()
                }
                .padding()
                HStack{
                    Text("Snow Level")
                        .padding()
                    Spacer()
                    Text(String(forecast.snow)+" cm")
                        .padding()
                }
                HStack{
                    Text("Wind Speed")
                        .padding()
                    Spacer()
                    Text(String(forecast.midStats.wind)+" mph")
                        .padding()
                }
                Button("Update") {
                    state.getWeather()
                }
            }
        }else{
            Text("Unable to retrieve weather at this time.")
                .padding()
            Button("Retry") {
                state.getWeather()
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

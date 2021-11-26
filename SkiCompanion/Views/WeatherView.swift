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
        VStack{
            Text(state.currentResort)
                .font(.title)
                .bold()
                .padding()
            HStack{
                Text("Sunny")
                    .padding()
                Image(systemName: "sun.max")
                    .padding()
                Text("3 °C")
                    .padding()
            }
            .padding()
            HStack{
                Text("Snow Level")
                    .padding()
                Spacer()
                Text("23 cm")
                    .padding()
            }
            HStack{
                Text("Wind Speed")
                    .padding()
                Spacer()
                Text("25 mph")
                    .padding()
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

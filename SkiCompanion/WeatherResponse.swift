//
//  WeatherResponse.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 29/11/2021.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let forecast: [WeatherInfo]
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case forecast = "forecast"
    }
}

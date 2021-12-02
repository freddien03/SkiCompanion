//
//  WeatherInfo.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 29/11/2021.
//

import Foundation

struct WeatherInfo: Decodable {
    let name: String
    let snow: Float
    let desc: String
    let temp: Int
    let wind: Int
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case snow = "snow_mm"
        case desc = "wx_desc"
        case temp = "temp_c"
        case wind = "windspd_mph"
    }
}

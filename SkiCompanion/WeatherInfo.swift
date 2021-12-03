//
//  WeatherInfo.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 29/11/2021.
//

import Foundation

struct WeatherInfo: Decodable {
    let snow: Float
    let midStats: Mid
    
    private enum CodingKeys: String, CodingKey {
        case snow = "snow_mm"
        case midStats = "mid"
    }
}

struct Mid: Decodable {
    let desc: String
    let wind: Int
    let temp: Float
    
    private enum CodingKeys: String, CodingKey {
        case desc = "wx_desc"
        case wind = "windspd_mph"
        case temp = "temp_c"
    }
}

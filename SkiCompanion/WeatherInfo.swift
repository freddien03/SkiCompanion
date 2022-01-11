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
    let baseStats: Base
    
    private enum CodingKeys: String, CodingKey {
        case snow = "snow_mm"
        case midStats = "mid"
        case baseStats = "base"
    }
}

struct Base: Decodable {
    let temp: Float?
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
    }
}

struct Mid: Decodable {
    let desc: String
    let image: String
    let wind: Int
    let temp: Float?
    
    private enum CodingKeys: String, CodingKey {
        case desc = "wx_desc"
        case image = "wx_icon"
        case wind = "windspd_mph"
        case temp = "temp_c"
    }
}

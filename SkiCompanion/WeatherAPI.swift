//
//  WeatherAPI.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 29/11/2021.
//

import Foundation

class WeatherAPI {
    let resortID = [
        "Verbier": "13034"
    ]
    let baseURL = "https://api.weatherunlocked.com/"
    
    func getWeather(_ toSearch: String, completion: @escaping (WeatherInfo?) -> Void) {
        let path = "api/resortforecast/\(resortID[toSearch] ?? "")?app_id=ef6a164d&app_key=88c9673884a12e2a3374ee1be536c93b"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: baseURL + path)
        else {
          print("invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response)
                }
            }
        }.resume()
        
    }
    
    func parseJson(json: Data) -> WeatherInfo? {
        let decoder = JSONDecoder()
        
        if let weatherResponse = try? decoder.decode(WeatherInfo.self, from: json) {
            return weatherResponse
        } else {
            print("error decoding JSON")
            return nil
        }
    }
}

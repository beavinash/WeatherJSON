//
//  ForecastService.swift
//  WeatherJSON
//
//  Created by Avinash Reddy on 7/25/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import Foundation

class ForecastService {
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    // forecaseBaseURL/forecastAPIKey/latitude,longitude
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    // get forecasts from lattitude and longitude
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void ) {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            let networkProcessor = NetworkProcessing(url: forecastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                // To-Do: parse the json dictionary into a object
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            })
        }
    }
}

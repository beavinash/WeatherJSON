//
//  CurrentWeather.swift
//  WeatherJSON
//
//  Created by Avinash Reddy on 7/25/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import Foundation

struct WeatherKey {
    static let temperature = "temperature"
    static let humidity = "humidity"
    static let precipProbability = "precipProbability"
    static let summary = "summary"
}

class CurrentWeather {
    let temerature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    init(weatherDictionary: [String: Any]) {
        temerature = weatherDictionary[WeatherKey.temperature] as? Int
        if let humidityDouble = weatherDictionary[WeatherKey.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKey.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKey.summary] as? String
    }

}

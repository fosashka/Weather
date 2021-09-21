//
//  WeatherBackgroundManager.swift
//  Weather
//
//  Created by Александр Фоминых on 21.09.2021.
//

import Foundation
import UIKit

enum WeatherBackgroundManager: String {
    case clearWeather = "clearWeather"
    case cloudyWeather = "cloudyWeather"
    case overcastWeather = "overcastWeather"
    case rainWeather = "rainWeather"
    case snowWeather = "snowWeather"
    case thunderstormWeather = "thunderstormWeather"
    case atmosphere = "atmosphere"
    
    init(rawValue: String) {
        switch rawValue {
        case "Thunderstorm":
            self = .thunderstormWeather
        case "Drizzle":
            self = .rainWeather
        case "Rain":
            self = .rainWeather
        case "Snow":
            self = .snowWeather
        case "Clear":
            self = .clearWeather
        case "Clouds":
            self = .cloudyWeather
        default:
            self = .atmosphere
        }
    }
}

extension WeatherBackgroundManager {
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

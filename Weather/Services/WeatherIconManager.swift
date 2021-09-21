//
//  WeatherIconManager.swift
//  Weather
//
//  Created by Александр Фоминых on 21.09.2021.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case clear = "clear"
    case cloudy = "cloudy"
    case lightRain = "lightRain"
    case overcast = "overcast"
//    case partlyCloudy = "partlyCloudy"
    case rain = "rain"
    case snow = "snow"
    case thunderstorm = "thunderstorm"
//    case thunderstormWithRain = "thunderstormWithRain"
//    case wetSnow = "wetSnow"
    
    init(rawValue: String) {
        switch rawValue {
        case "Thunderstorm":
            self = .thunderstorm
        case "Drizzle":
            self = .lightRain
        case "Rain":
            self = .rain
        case "Snow":
            self = .snow
        case "Clear":
            self = .clear
        case "Clouds":
            self = .cloudy
        default:
            self = .overcast
        }
    }
}

extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

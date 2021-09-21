//
//  CurrentWeather.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//

import Foundation
import UIKit

struct CurrentWeather: Codable {
    let coord: CoordinatesResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let name: String
}

struct CoordinatesResponse: Codable {
    let lon: Double
    let lat: Double
}

struct WeatherResponse: Codable {
    let main: String
    let description: String
    let icon: String
}

struct MainResponse: Codable {
    let temp: Double
    let feelsLike: Double
    let pressure: Double
    let humidity: Double
}

extension MainResponse {
    var tempString: String { return "\(temp)" }
    var pressureString: String { return "Давление: \(pressure) мм" }
    var humidityString: String { return "Влажность: \(humidity) %" }
    var feelsLikeString: String { return "Ощущается как: \(feelsLike)˚" }
}

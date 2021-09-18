//
//  DailyWeather.swift
//  Weather
//
//  Created by Александр Фоминых on 03.09.2021.
//

import Foundation
import UIKit

struct DailyWeather: Codable {
    let daily: [DailyResponse]
}

struct DailyResponse: Codable {
    let temp: TempResponse
    let weather: [DailyWeatherResponse]
}

struct TempResponse: Codable {
    let min: Double
    let max: Double
}

struct DailyWeatherResponse: Codable {
    let icon: String
}

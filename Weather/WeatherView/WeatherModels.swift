//
//  WeatherModels.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Weather {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getCurrentWeather
        case getDailyWeather
      }
    }
    struct Response {
      enum ResponseType {
        case presentCurrentWeather(weather: CurrentWeather)
        case presentDailyWeather(weather: DailyWeather)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayCurrentWeather(weatherViewModel: WeatherViewModel.Header)
        case displayDailyWeather(weatherViewModel: WeatherViewModel)
      }
    }
  }
}

struct WeatherViewModel {
    struct Header: WeatherTableHeader {
        var cityName: String
        var weatherMainConditionGroup: UIImage
        var weatherCondition: String
        var temp: String
        var feelsLike: String
        var pressure: String
        var humidity: String
    }
    
    struct DailyCell: WeatherTableViewCellProtocol {
        var dayOfWeek: String
        var iconWeather: UIImage
        var maxTemp: String
        var minTemp: String
    }
    
    let dailyCells: [DailyCell]
    
}

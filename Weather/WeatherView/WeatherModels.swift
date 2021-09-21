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
      }
    }
    struct Response {
      enum ResponseType {
        case presentCurrentWeather(weather: CurrentWeather)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayCurrentWeather(weatherViewModel: WeatherViewModel.Cell)
      }
    }
  }
}

struct WeatherViewModel {
    struct Cell: WeatherTableHeader {
        var cityName: String
        var weatherMainConditionGroup: UIImage
        var weatherCondition: String
        var temp: String
        var feelsLike: String
        var pressure: String
        var humidity: String
    }
    
    let cells: [Cell]
    
}

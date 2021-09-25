//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol WeatherPresentationLogic {
    func presentData(response: Weather.Model.Response.ResponseType)
}

class WeatherPresenter: WeatherPresentationLogic {
    weak var viewController: WeatherDisplayLogic?
    
    func presentData(response: Weather.Model.Response.ResponseType) {
        switch response {
        case .presentCurrentWeather(weather: let weather):
            
            viewController?.displayData(viewModel: Weather.Model.ViewModel.ViewModelData.displayCurrentWeather(weatherViewModel: currentCellViewModel(currentWeather: weather)))
            
        case .presentDailyWeather(weather: let weather):
            
            let dailyCells = weather.daily.map { dailyResponse in
                dailyCellViewModel(dailyWeather: dailyResponse, iconWeather: dailyResponse.weather)
            }
            let dailyViewModel = WeatherViewModel.init(dailyCells: dailyCells)
            viewController?.displayData(viewModel: Weather.Model.ViewModel.ViewModelData.displayDailyWeather(weatherViewModel: dailyViewModel))
        }
    }
    
    private func currentCellViewModel(currentWeather: CurrentWeather) -> WeatherViewModel.Header {
        
        var weatherCondition: String?
        var weatherMainConditionGroup: String?
        
        for currentIndex in currentWeather.weather {
            weatherCondition = currentIndex.description
            weatherMainConditionGroup = currentIndex.main
        }
        
        let background = WeatherBackgroundManager(rawValue: weatherMainConditionGroup ?? "").image
    
        return WeatherViewModel.Header.init(cityName: currentWeather.name,
                                          weatherMainConditionGroup: background,
                                          weatherCondition: weatherCondition ?? "",
                                          temp: currentWeather.main.tempString,
                                          feelsLike: currentWeather.main.feelsLikeString,
                                          pressure: currentWeather.main.pressureString,
                                          humidity: currentWeather.main.humidityString)
    }
    
    private func dailyCellViewModel(dailyWeather: DailyResponse, iconWeather: [DailyWeatherResponse]) -> WeatherViewModel.DailyCell {
        
        return WeatherViewModel.DailyCell.init(dayOfWeek: getDayForDate(date: dailyWeather.dt),
                                               iconWeather: iconWeatherImage(imageCount: iconWeather),
                                               maxTemp: dailyWeather.temp.maxString,
                                               minTemp: dailyWeather.temp.minString)
    }
    
    private func getDayForDate(date: Date?) -> String {
        guard let inputDate = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: inputDate).capitalized
    }
    
    private func iconWeatherImage(imageCount: [DailyWeatherResponse]) -> UIImage {
        var iconWeather: UIImage?
        for image in imageCount {
            iconWeather = WeatherIconManager(rawValue: image.main ).image
        }
        return iconWeather ?? UIImage()
    }
}

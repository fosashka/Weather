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
            
            viewController?.displayData(viewModel: Weather.Model.ViewModel.ViewModelData.displayCurrentWeather(weatherViewModel: cellViewModel(currentWeather: weather)))
        }
    }
    
    private func cellViewModel(currentWeather: CurrentWeather) -> WeatherViewModel.Cell {
        
        var weatherCondition: String?
        
        for currentIndex in currentWeather.weather {
            weatherCondition = currentIndex.description
        }
        
    
        return WeatherViewModel.Cell.init(cityName: currentWeather.name,
                                          weatherCondition: weatherCondition ?? "",
                                          temp: currentWeather.main.tempString,
                                          feelsLike: currentWeather.main.feelsLikeString,
                                          pressure: currentWeather.main.pressureString,
                                          humidity: currentWeather.main.humidityString)
    }
}

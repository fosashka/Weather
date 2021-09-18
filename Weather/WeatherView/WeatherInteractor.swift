//
//  WeatherInteractor.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol WeatherBusinessLogic {
    func makeRequest(request: Weather.Model.Request.RequestType)
}

class WeatherInteractor: WeatherBusinessLogic {
    
    var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    var presenter: WeatherPresentationLogic?
    var service: WeatherService?
    
    
    func makeRequest(request: Weather.Model.Request.RequestType) {
        if service == nil {
            service = WeatherService()
        }
        
        switch request {
        case .getCurrentWeather:
            service?.fetchCurrentWeather(completion: { [weak self] currentWeather in
                guard let currentWeather = currentWeather else { return }
                self?.presenter?.presentData(response: Weather.Model.Response.ResponseType.presentCurrentWeather(weather: currentWeather))
            })
        }
    }
    
}

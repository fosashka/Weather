//
//  WeatherWorker.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class WeatherService {
    
    var fetcher: DataFetcher
    
    init(fetcher: DataFetcher = NetworkDataFetcher()) {
        self.fetcher = fetcher
    }
    
    func fetchCurrentWeather(completion: @escaping (CurrentWeather?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Bryansk&lang=ru&units=metric&appid=8ad92944a6b08c24bdb95ae031002823"
        fetcher.getWeather(urlString: urlString, response: completion)
    }

}

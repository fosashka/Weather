//
//  TableHeader.swift
//  Weather
//
//  Created by Александр Фоминых on 05.09.2021.
//

import Foundation
import UIKit

protocol WeatherTableHeader {
    var cityName: String { get }
    var weatherCondition: String { get }
    var temp: String { get }
    var feelsLike: String { get }
    var pressure: String { get }
    var humidity: String { get }
}

class TableHeader: UIView {
    
    private var cityName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weatherCondition: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var temp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 90, weight: .thin)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var degreeSign: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 90, weight: .thin)
//        label.textColor = .white
        label.text = "˚"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var feelsLike: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var pressure: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var humidity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = .white
        label.text = "-----"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cityName)
        addSubview(weatherCondition)
        addSubview(temp)
        addSubview(degreeSign)
        addSubview(feelsLike)
        addSubview(pressure)
        addSubview(humidity)

        makeStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: WeatherTableHeader) {
        self.cityName.text = viewModel.cityName
        self.weatherCondition.text = viewModel.weatherCondition
        self.temp.text = viewModel.temp
        self.feelsLike.text = viewModel.feelsLike
        self.pressure.text = viewModel.pressure
        self.humidity.text = viewModel.humidity
        
    }
    
    private func makeStackView() {
        
        // city constraints
        cityName.bottomAnchor.constraint(equalTo: weatherCondition.topAnchor, constant: -5).isActive = true
        cityName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // weatherCondition constraints
        weatherCondition.bottomAnchor.constraint(equalTo: temp.topAnchor, constant: -5).isActive = true
        weatherCondition.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // temp constraints
        temp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temp.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15).isActive = true

        // degreeSign constraints
        degreeSign.centerYAnchor.constraint(equalTo: temp.centerYAnchor).isActive = true
        degreeSign.leadingAnchor.constraint(equalTo: temp.trailingAnchor).isActive = true

        // feelsLike constraints
        feelsLike.topAnchor.constraint(equalTo: temp.bottomAnchor, constant: 5).isActive = true
        feelsLike.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // pressure constraints
        pressure.topAnchor.constraint(equalTo: feelsLike.bottomAnchor, constant: 25).isActive = true
        pressure.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true

        // humidity canstraints
        humidity.topAnchor.constraint(equalTo: feelsLike.bottomAnchor, constant: 25).isActive = true
        humidity.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
}

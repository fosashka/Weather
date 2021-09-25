//
//  TableViewCell.swift
//  Weather
//
//  Created by Александр Фоминых on 21.09.2021.
//

import Foundation
import UIKit

protocol WeatherTableViewCellProtocol {
    var dayOfWeek: String { get }
    var iconWeather: UIImage { get }
    var maxTemp: String { get }
    var minTemp: String { get }
}

class WeatherTableViewCell: UITableViewCell {
    
    static let reuseId = "WeatherTableViewCell"
    
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        dayOfWeek.textColor = .white
//        maxTemp.textColor = .white
//        minTemp.textColor = .white
        
        cardView.layer.cornerRadius = 15
        cardView.backgroundColor = #colorLiteral(red: 0.6587240816, green: 0.6587240816, blue: 0.6587240816, alpha: 0.35)
        
    }
    
    func setWeatherTableViewCell(viewModel: WeatherTableViewCellProtocol) {
        self.dayOfWeek.text = viewModel.dayOfWeek
        self.iconWeather.image = viewModel.iconWeather
        self.maxTemp.text = viewModel.maxTemp
        self.minTemp.text = viewModel.minTemp
    }
}

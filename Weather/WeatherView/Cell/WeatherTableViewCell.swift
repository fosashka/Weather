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
        
        setDesignLabel()
        
        cardView.backgroundColor = .clear
        cardView.layer.cornerRadius = 15
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = contentView.bounds
        cardView.insertSubview(blurView, at: 0)
        
        
    }
    
    func setWeatherTableViewCell(viewModel: WeatherTableViewCellProtocol) {
        self.dayOfWeek.text = viewModel.dayOfWeek
        self.iconWeather.image = viewModel.iconWeather
        self.maxTemp.text = viewModel.maxTemp
        self.minTemp.text = viewModel.minTemp
    }
    
    private func setDesignLabel() {
        dayOfWeek.textColor = .white
        dayOfWeek.layer.shadowColor = UIColor.black.cgColor
        dayOfWeek.layer.shadowRadius = 1.5
        dayOfWeek.layer.shadowOpacity = 0.7
        dayOfWeek.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        maxTemp.textColor = .white
        maxTemp.layer.shadowColor = UIColor.black.cgColor
        maxTemp.layer.shadowRadius = 1.5
        maxTemp.layer.shadowOpacity = 0.7
        maxTemp.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        minTemp.textColor = .white
        minTemp.layer.shadowColor = UIColor.black.cgColor
        minTemp.layer.shadowRadius = 1.5
        minTemp.layer.shadowOpacity = 0.7
        minTemp.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}

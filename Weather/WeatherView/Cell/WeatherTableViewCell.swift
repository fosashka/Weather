//
//  TableViewCell.swift
//  Weather
//
//  Created by Александр Фоминых on 21.09.2021.
//

import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let reuseId = "WeatherTableViewCell"
    
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

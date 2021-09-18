//
//  Nib.swift
//  Weather
//
//  Created by Александр Фоминых on 05.09.2021.
//

import Foundation
import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?[0] as! T
    }
}

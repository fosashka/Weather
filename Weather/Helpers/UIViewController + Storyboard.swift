//
//  UIViewController + Storyboard.swift
//  Weather
//
//  Created by Александр Фоминых on 02.09.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoriboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storiboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storiboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
}

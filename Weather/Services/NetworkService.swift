//
//  NetworkService.swift
//  Weather
//
//  Created by Александр Фоминых on 04.09.2021.
//

import Foundation
import UIKit

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, complection: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, complection: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                complection(data, error)
            }
        }
    }
}

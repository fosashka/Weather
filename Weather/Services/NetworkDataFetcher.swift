//
//  NetworkDataFetcher.swift
//  Weather
//
//  Created by Александр Фоминых on 04.09.2021.
//

import Foundation
import UIKit

protocol DataFetcher {
    func getWeather<T: Codable>(urlString: String, response: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func getWeather<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
        networking.request(urlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Codable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}

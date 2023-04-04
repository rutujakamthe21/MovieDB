//
//  APIManager.swift
//  Movie Catalogue
//
//  Created by Neosoft on 28/03/23.
//

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(_ error: Error?)
}

typealias Handler<T> = (Result<T, DataError>) -> Void

import UIKit

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func request<T: Codable>(modelType: T.Type, urlString: String, completion: @escaping Handler<T>) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let allData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(allData))
            }catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}

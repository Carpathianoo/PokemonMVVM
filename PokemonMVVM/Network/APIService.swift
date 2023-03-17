//
//  APIService.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import Foundation

protocol ApiServiceProtocol {
    mutating func get(url: URL)
    func callApi<T: Codable>(url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

struct ApiService: ApiServiceProtocol {
    
    private var url = URL(string: "")
    
    mutating func get(url: URL) {
        self.url = url
    }
    
    func callApi<T>(url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let unwrappedUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: unwrappedUrl) { data, reponse, error in
            if let data = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(modelData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}



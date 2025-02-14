//
//  CatService.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import Foundation

protocol CatAPIServiceProtocol {
    func fetchCats(page: Int, limit: Int, completion: @escaping (Result<[Cat], Error>) -> Void)
}

class CatAPIService: CatAPIServiceProtocol {
    private let baseURL = "https://api.thecatapi.com/v1/images/search"
    private let api_key = "{put_your_api_key_here}"

    func fetchCats(page: Int, limit: Int, completion: @escaping (Result<[Cat], Error>) -> Void)  {
        let urlString = "\(baseURL)?limit=\(limit)&page=\(page)&has_breeds=1&api_key=\(api_key)"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(cats))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

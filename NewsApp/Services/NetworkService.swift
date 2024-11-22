//
//  NetworkService.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import Foundation
import Combine

class NetworkService {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetch<T: Decodable>(from url: URL) -> AnyPublisher<T, Error> {
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

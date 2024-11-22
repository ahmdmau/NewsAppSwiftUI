//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func fetchNews() {
        guard let url = URL(string: "https://jsonplaceholder.org/posts") else {
            errorMessage = "Invalid URL"
            return
        }

        isLoading = true

        networkService.fetch(from: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
                self?.isLoading = false
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
}

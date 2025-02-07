//
//  CatViewModel.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let catService: CatServiceProtocol
    private var currentPage = 0
    private let limit = 10
    public var isFetching = false

    init(catService: CatServiceProtocol = CatService()) {
        self.catService = catService
    }

    func fetchCats(reset: Bool = false, completionBlock: ((Result<[Cat], Error>) -> Void)? = nil) {
        if isFetching { return }
        
        isFetching = true
        isLoading = reset
        errorMessage = nil
        
        if reset {
            currentPage = 0
            cats.removeAll()
        }

        catService.fetchCats(page: currentPage, limit: limit) {
            [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                self?.isLoading = false
                
                switch result {
                case .success(let newCats):
                    self?.cats.append(contentsOf: newCats)
                    self?.currentPage += 1
                    if completionBlock != nil {
                        completionBlock?(.success(self!.cats))
                    }
                case .failure(let error):
                    self?.errorMessage = "Failed to load cats: \(error.localizedDescription)"
                    if completionBlock != nil {
                        completionBlock?(.failure(error))
                    }
                }
            }
        }
    }
}

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

    private var currentPage = 0
    private let limit = 10
    private var isFetching = false

    init() {
        fetchCats(reset: true)
    }

    func fetchCats(reset: Bool = false) {
        if isFetching { return }
        
        isFetching = true
        isLoading = reset
        errorMessage = nil
        
        if reset {
            currentPage = 0
            cats.removeAll()
        }

        CatService.shared.fetchCats(page: currentPage, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                self?.isLoading = false
                
                switch result {
                case .success(let newCats):
                    self?.cats.append(contentsOf: newCats)
                    self?.currentPage += 1
                case .failure(let error):
                    self?.errorMessage = "Failed to load cats: \(error.localizedDescription)"
                }
            }
        }
    }
}

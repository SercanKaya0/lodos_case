//
//  HomeViewModel.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

final class HomeViewModel: HomeViewModelContracts {
    
    weak var routes: HomeViewModelRoute?
    weak var output: HomeViewModelOutput?
    var repository: MoviesRepositoryConracts
    
    init(repository: MoviesRepositoryConracts) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String) {
        fetchMovies()
    }
}

// MARK: - Requests
extension HomeViewModel {
 
    private func fetchMovies() {
        self.repository.getMovies(search: "Batman", page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                self.output?.showMovieError(message: error.localizedDescription)
            }
        }
    }
}

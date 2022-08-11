//
//  MovieDetailViewModel.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation

final class MoviesDetailViewModel: MovieDetailViewModelContracts {
    var repository: MoviesRepositoryConracts
    var routes: MovieDetailViewModelRoute?
    var output: MovieDetailViewModelOutput?
    var movieData: MovieMetaData?
    
    private var imdbId: String?
        
    init(imdbId: String?, repository: MoviesRepositoryConracts) {
        self.imdbId = imdbId
        self.repository = repository
    }
    
    func viewDidLoad() {
        fetchMovieDetail()
    }
}

// MARK: - DataSources
extension MoviesDetailViewModel {

}

// MARK: - ConfigureContents
extension MoviesDetailViewModel {
    
}


// MARK: - Requests
extension MoviesDetailViewModel {
    
    private func fetchMovieDetail() {
        guard let imdbId = imdbId else { return }
        repository.getMovieDetail(imdbId: imdbId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movieData = response
                self.output?.notifyResponse(data: response)
            case .failure(let error):
                self.output?.showRequestError(message: error.localizedDescription)
            }
        }
    }
}

//
//  MovieRepository.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

final class MoviesRepository: MoviesRepositoryConracts {

    let moviesServices: MoviesDataSources
    
    init(moviesServices: MoviesDataSources) {
        self.moviesServices = moviesServices
    }
    
    func getMovies(search: String, page: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        moviesServices.getMovies(search: search, page: page) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieMetaData, NetworkError>) -> Void) {
        moviesServices.getMovieDetail(imdbId: imdbId) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  MoviesServices.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

final class MoviesServices: MoviesDataSources {
    func getMovies(search: String, page: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: TheOmdbAPI.getMovies(search: search, page: page), responseModel: Movie.self, completion: completion)
    }
}

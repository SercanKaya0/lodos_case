//
//  MovieRepositoryContracts.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

protocol MoviesRepositoryConracts {
    func getMovies(search: String, page: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void)
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieMetaData, NetworkError>) -> Void)
}

//
//  MovieDetailBuilder.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation

final class MovieDetailBuilder {
    
    static func make(imdbId: String?) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let services = MoviesServices()
        let repository = MoviesRepository(moviesServices: services)
        let viewModel = MoviesDetailViewModel(imdbId: imdbId, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

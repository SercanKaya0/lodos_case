//
//  MovieDetailContracts.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation

//MARK: - Contracts
protocol MovieDetailViewModelContracts {
    var routes: MovieDetailViewModelRoute? { get set }
    var output: MovieDetailViewModelOutput? { get set }
    var repository: MoviesRepositoryConracts { get set }
        
    func viewDidLoad()
}

// MARK: - Routes
protocol MovieDetailViewModelRoute: AnyObject {
}

//MARK: - Outputs
protocol MovieDetailViewModelOutput: AnyObject {
    func showRequestError(message: String)
    func notifyResponse(data: MovieMetaData?)
}

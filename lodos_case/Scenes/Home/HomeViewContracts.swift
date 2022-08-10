//
//  HomeViewContracts.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

//MARK: - Contracts
protocol HomeViewModelContracts {
    var routes: HomeViewModelRoute? { get set }
    var output: HomeViewModelOutput? { get set }
    var repository: MoviesRepositoryConracts { get set }
   
    func viewDidLoad()
    func textDidChange(text: String)
}

// MARK: - Routes
protocol HomeViewModelRoute: AnyObject {
}

//MARK: - Outputs
protocol HomeViewModelOutput: AnyObject {
    func showMovieError(message: String)
}

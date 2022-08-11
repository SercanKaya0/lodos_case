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
   
    var numberOfRowsInSection: Int { get }
    var moviesData: [Search]? { get set }
    var searhcText: String { get set }
    
    func viewDidLoad()
    func textDidChange(text: String)
    func swipeConfigration(search: String)
    func didSelectRowAt(_ indexPath: IndexPath)
}

// MARK: - Routes
protocol HomeViewModelRoute: AnyObject {
    func presentMovieDetail(imdbId: String?)
}

//MARK: - Outputs
protocol HomeViewModelOutput: AnyObject {
    func showMovieError(message: String)
    func showLoadingIndicator(isShow: Bool)
    func showEmptyData(isShow: Bool)
    func reloadTableView()
    func showBottomLoadingIndicator(isShow: Bool)
}

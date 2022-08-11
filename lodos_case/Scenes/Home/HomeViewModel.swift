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
    
    var searhcText: String = ""
    var moviesData: [Search]?
    var movieData: Movie?
    
    private var currentPage: Int = 1
    
    init(repository: MoviesRepositoryConracts) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String) {
        if !text.isEmpty {
            self.searhcText = text
            fetchMovies(search: text)
        }
    }
    
    func swipeConfigration(search: String) {
        fetchMovieWithPaggination(search: search)
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) {
        let id = moviesData?[indexPath.row].imdbID
        routes?.presentMovieDetail(imdbId: id)
    }
}

// MARK: - DataSources
extension HomeViewModel {
 
    var numberOfRowsInSection: Int {
        return moviesData?.count ?? 0
    }
}

// MARK: - ConfigureContents
extension HomeViewModel {
    
    private func configureCellItem(searhData: [Search]?, isPagination: Bool) {
        guard let searhData = searhData else {
            return
        }
        if isPagination {
            searhData.forEach { item in
                self.moviesData?.append(item)
            }
        } else {
            self.moviesData = searhData
        }
     
    }
}


// MARK: - Requests
extension HomeViewModel {
 
    private func fetchMovies(search: String) {
        output?.showLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: 1) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.configureCellItem(searhData: response.search, isPagination: false)
                self.movieData = response
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMovieError(message: error.localizedDescription)
            }
        }
    }
    
    private func fetchMovieWithPaggination(search: String) {
        guard let totalPage = movieData?.totalResults, currentPage <= Int(totalPage) ?? 0 else { return }
        output?.showBottomLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.output?.showBottomLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.currentPage += 1
                self.configureCellItem(searhData: response.search, isPagination: true)
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMovieError(message: error.localizedDescription)
            }
        }
    }
}

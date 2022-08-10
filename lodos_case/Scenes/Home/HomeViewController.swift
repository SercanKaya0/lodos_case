//
//  HomeViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import UIKit
import TinyConstraints

final class HomeViewController: UIViewController {

    var viewModel: HomeViewModelContracts = HomeViewModel(repository: MoviesRepository(moviesServices: MoviesServices()))
    
    private let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addSearchBar()
    }
    
    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.topToSuperview(offset: 16, usingSafeArea: true)
        searchBar.horizontalToSuperview(insets: .horizontal(16))
        searchBar.height(52)
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureViewController()
        configureNavigationBar()
        configureViewModel()
        configureSearchBar()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
    }
    
    private func configureNavigationBar() {
        navigationItem.hidesBackButton = true
        navigationItem.title = "Anasayfa"
    }
    
    private func configureViewModel() {
        viewModel.routes = self
        viewModel.output = self
    }
    
    private func configureSearchBar() {
        searchBar.placeholder = "Ara..."
        searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.textDidChange(text: searchText)
    }
}

// MARK: - HomeViewModelOutput
extension HomeViewController: HomeViewModelOutput {
    func showMovieError(message: String) {
        print(message)
    }
}

// MARK: - HomeViewModelRoute
extension HomeViewController: HomeViewModelRoute {
    
}


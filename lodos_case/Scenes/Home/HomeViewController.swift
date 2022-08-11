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
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        return tableView
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
        addTableView()
    }
    
    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.topToSuperview(offset: 16, usingSafeArea: true)
        searchBar.horizontalToSuperview(insets: .horizontal(16))
        searchBar.height(52)
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview(excluding: .top)
        tableView.topToBottom(of: searchBar)
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureViewController()
        configureNavigationBar()
        configureViewModel()
        configureSearchBar()
        configureTableView()
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
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        if let data = viewModel.moviesData?[indexPath.row] {
            cell.populate(image: data.poster, title: data.title, year: data.year)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell as? MovieCell != nil && viewModel.numberOfRowsInSection - 3 == indexPath.row {
            viewModel.swipeConfigration(search: viewModel.searhcText)
        }
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
    func showBottomLoadingIndicator(isShow: Bool) {
        if isShow {
            self.tableView.showSpinnerView()
        } else {
            self.tableView.hideSpinnerView()
        }
    }
    
    func showEmptyData(isShow: Bool) {
        if isShow {
            self.tableView.setEmptyViewIcon(message: "Gösterilecek bir Sonuç Bulunamadı", image: UIImage(systemName: "magnifyingglass") ?? .remove)
        } else {
            self.tableView.restore()
        }
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showLoadingIndicator(isShow: Bool) {
        if isShow {
            self.tableView.showActivityIndicator()
        } else {
            self.tableView.restore()
        }
    }
    
    func showMovieError(message: String) {
        let alertController = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(confirmAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - HomeViewModelRoute
extension HomeViewController: HomeViewModelRoute {
    func presentMovieDetail(imdbId: String?) {
        let viewController = MovieDetailBuilder.make(imdbId: imdbId)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

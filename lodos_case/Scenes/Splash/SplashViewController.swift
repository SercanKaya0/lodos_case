//
//  SplashViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import UIKit

class SplashViewController: UIViewController {

    var viewModel: SplashViewModelContracts = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        viewModel.viewDidLoad()
    }
}

// MARK: - ConfigureContents
extension SplashViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel.routes = self
        viewModel.output = self
    }
}


// MARK: - SplashViewModelOutput
extension SplashViewController: SplashViewModelOutput {
    func showInternetError(message: String) {
        let alertController = UIAlertController(title: "Connection Error", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Tekrar Dene", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.retry()
        }
        alertController.addAction(confirmAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - SplashViewModelRoute
extension SplashViewController: SplashViewModelRoute {
    func presentHome() {
        let viewController = HomeViewBuilder.make()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

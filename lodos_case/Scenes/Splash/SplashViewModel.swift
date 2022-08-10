//
//  SplashViewModel.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

final class SplashViewModel: SplashViewModelContracts {

    weak var routes: SplashViewModelRoute?
    weak var output: SplashViewModelOutput?
    
    func viewDidLoad() {
        hasInternet()
    }
    
    func titleLabelTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let self = self else { return }
            self.routes?.presentHome()
        }
    }
}

// MARK: - Requests
extension SplashViewModel {
 
    private func hasInternet() {
        if Connectivity.isConnectedToInternet() {
            output?.fetchRemoteConfigration()
        } else {
            output?.showInternetError(message: "NO INTERNET CONNECTION")
        }
    }
}

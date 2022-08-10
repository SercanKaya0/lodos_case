//
//  SplashViewContracts.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

//MARK: - Contracts
protocol SplashViewModelContracts {
    var routes: SplashViewModelRoute? { get set }
    var output: SplashViewModelOutput? { get set }
   
    func viewDidLoad()
    func retry()
}

// MARK: - Routes
protocol SplashViewModelRoute: AnyObject {
    func presentHome()
}

//MARK: - Outputs
protocol SplashViewModelOutput: AnyObject {
    func showInternetError(message: String)
}

//
//  HomeViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .red
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.hidesBackButton = true
    }
}


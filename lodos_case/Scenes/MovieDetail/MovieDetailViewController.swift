//
//  MovieDetailViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit
import TinyConstraints

class MovieDetailViewController: UIViewController {

    public var viewModel: MovieDetailViewModelContracts?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        return imageView
    }()
    
    private let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .white.withAlphaComponent(0.3)
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel?.viewDidLoad()
    }
}

// MARK: - UILayout
extension MovieDetailViewController {
    
    private func addSubViews() {
        addImageView()
        addContainerView()
        addTitleLabel()
    }
    
    private func addImageView() {
        view.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .bottom)
        let height = UIScreen.main.bounds.height
        imageView.height(height * 0.40)
    }
    
    private func addContainerView() {
        imageView.addSubview(containerView)
        containerView.horizontalToSuperview(insets: .horizontal(16))
        containerView.bottomToSuperview(offset: -16)
        imageView.layoutIfNeeded()
        containerView.height(imageView.frame.height * 0.30)
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(excluding: .bottom, insets: .horizontal(16) + .top(16))
    }
}


// MARK: - ConfigureContents
extension MovieDetailViewController {
    
    private func configureContents() {
        configureViewController()
        configureViewModel()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
    }
    
    private func configureViewModel() {
        viewModel?.routes = self
        viewModel?.output = self
    }
}


// MARK: - MovieDetailViewModelOutput
extension MovieDetailViewController: MovieDetailViewModelOutput {
    func notifyResponse(data: MovieMetaData?) {
        guard let data = data else {
            return
        }
        imageView.kf.setImage(with: data.poster?.lodosURL)
        titleLabel.text = data.title
    }
    
    func showRequestError(message: String) {
        let alertController = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(confirmAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - MovieDetailViewModelRoute
extension MovieDetailViewController: MovieDetailViewModelRoute {
    
}

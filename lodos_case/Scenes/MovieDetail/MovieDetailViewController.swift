//
//  MovieDetailViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit
import TinyConstraints
import FirebaseAnalytics

class MovieDetailViewController: UIViewController {
    
    public var viewModel: MovieDetailViewModelContracts?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        return imageView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let ratingView = RatingsView()
    
    private let directorView = DataRowView()
    private let writerView = DataRowView()
    private let actorsView = DataRowView()
    private let languageView = DataRowView()
    
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
        addRatingView()
        addDirectorView()
        addWriterView()
        addActorsView()
        addLanguageView()
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
    
    private func addRatingView() {
        containerView.addSubview(ratingView)
        ratingView.topToBottom(of: titleLabel, offset: 16)
        ratingView.leading(to: titleLabel)
        ratingView.trailing(to: titleLabel)
        ratingView.bottomToSuperview(offset: -16)
    }
    
    private func addDirectorView() {
        view.addSubview(directorView)
        directorView.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(16))
        directorView.topToBottom(of: imageView, offset: 16)
    }
    
    private func addWriterView() {
        view.addSubview(writerView)
        writerView.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(16))
        writerView.topToBottom(of: directorView, offset: 16)
    }
    
    private func addActorsView() {
        view.addSubview(actorsView)
        actorsView.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(16))
        actorsView.topToBottom(of: writerView, offset: 16)
    }
    
    private func addLanguageView() {
        view.addSubview(languageView)
        languageView.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(16))
        languageView.topToBottom(of: actorsView, offset: 16)
    }
}

// MARK: - ConfigureContents
extension MovieDetailViewController {
    
    private func configureContents() {
        configureViewController()
        configureViewModel()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white.withAlphaComponent(0.8)
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
        ratingView.ratingData = data.ratings
        
        directorView.setKey = "Plot:"
        writerView.setKey = "Writer:"
        actorsView.setKey = "Actors:"
        languageView.setKey = "Language:"
        directorView.setValue = data.director
        writerView.setValue = data.writer
        actorsView.setValue = data.actors
        languageView.setValue = data.language
        
        Analytics.logEvent("MovieDetailViewController", parameters: [
            "data": data
        ])

        
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

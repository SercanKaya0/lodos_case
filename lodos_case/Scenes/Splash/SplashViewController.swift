//
//  SplashViewController.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import UIKit
import FirebaseRemoteConfig
import TinyConstraints

class SplashViewController: UIViewController {

    var viewModel: SplashViewModelContracts = SplashViewModel()
    var remoteConfig: RemoteConfig?
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let tapGesture: UITapGestureRecognizer = {
       let tapGesture = UITapGestureRecognizer()
        return tapGesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
}

// MARK: - ConfigureContents
extension SplashViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        configureViewModel()
        configureRemoteConfig()
        configureTitleLabel()
    }
    
    private func configureViewModel() {
        viewModel.routes = self
        viewModel.output = self
    }
    
    private func configureRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig?.configSettings = setting
    }
    
    private func configureTitleLabel() {
        titleLabel.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(titleLabelTapped))
    }
}

// MARK: - Actions
extension SplashViewController {
    @objc
    private func titleLabelTapped() {
        viewModel.titleLabelTapped()
    }
}

// MARK: - SplashViewModelOutput
extension SplashViewController: SplashViewModelOutput {
    func fetchRemoteConfigration() {
        let defaults: [String: NSObject] = ["connection_text" : false as NSObject]
        self.remoteConfig?.setDefaults(defaults)
        self.remoteConfig?.fetch(withExpirationDuration: 0, completionHandler: { [weak self] status, error in
            guard let self = self else { return }
            if status == .success, error == nil {
                self.remoteConfig?.activate(completion: { bool, error in
                    guard error == nil else { return }
                    let value = self.remoteConfig?.configValue(forKey: "connection_text")
                    DispatchQueue.main.async {
                        self.titleLabel.text = value?.stringValue
                    }
                })
            } else {
                let alertController = UIAlertController(title: "Remote Config", message: "Remote Configrasyonda Bir Hata Oluştu", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Tamam", style: .default)
                alertController.addAction(confirmAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true)
                }
            }
        })
    }
    
    func showInternetError(message: String) {
        let alertController = UIAlertController(title: "Connection Error", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Tamam", style: .default)
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

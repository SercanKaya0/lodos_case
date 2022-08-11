//
//  ChipView.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit

class ChipView: UIView {

    private let backgroundColors: [UIColor] = [.blue, .purple, .orange, .yellow]
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var setTitle: String? {
        didSet {
            if let title = setTitle {
                titleLabel.text = "\(String(describing: title))⭐"
            }
        }
    }
    
    public var currentIndex: Int = 0 {
        didSet {
            if currentIndex <= backgroundColors.count {
                backgroundColor = backgroundColors[currentIndex]
            } else {
                backgroundColor = backgroundColors[0]
            }
        }
    }
}

// MARK: - UILayout
extension ChipView {
    
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.horizontalToSuperview(insets: .horizontal(4))
        titleLabel.centerInSuperview()
    }
}


// MARK: - ConfigureContents
extension ChipView {
    
    private func configureContents() {
        height(32)
        layer.cornerRadius = 10
      
    }
}


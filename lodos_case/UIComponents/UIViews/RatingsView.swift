//
//  RatingsView.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit

class RatingsView: UIView {

    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var ratingData: [Rating]? {
        didSet {
            configureContents()
        }
    }
}

// MARK: - UILayout
extension RatingsView {
    
    private func addSubViews() {
        addStackView()
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.edgesToSuperview(excluding: .trailing)
    }
}

// MARK: - ConfigureContents
extension RatingsView {
    
    private func configureContents() {
        guard let data = ratingData else { return }
        stackView.removeFullyAllArrangedSubviews()
        data.enumerated().forEach { item in
            let view = ChipView()
            view.setTitle = item.element.value
            view.currentIndex = item.offset
            stackView.addArrangedSubview(view)
        }
    }
}


//
//  DataRowView.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit
import TinyConstraints

class DataRowView: UIView {
    
    private let keyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var setKey: String? {
        didSet {
            keyLabel.text = setKey
        }
    }
    
    public var setValue: String? {
        didSet {
            valueLabel.text = setValue
        }
    }
}

// MARK: - UILayout
extension DataRowView {
    
    private func addSubViews() {
        addKeyLabel()
        addValueLabel()
    }
    
    private func addKeyLabel() {
        addSubview(keyLabel)
        keyLabel.edgesToSuperview(excluding: .trailing, insets: .left(8), priority: .init(rawValue: 999))
    }
    
    private func addValueLabel() {
        addSubview(valueLabel)
        valueLabel.trailingToSuperview(offset: 16)
        valueLabel.leadingToTrailing(of: keyLabel, offset: 8)
        valueLabel.centerY(to: keyLabel)
    }
}


// MARK: - ConfigureContents
extension DataRowView {
    
    private func configureContents() {
        height(32)
        layer.cornerRadius = 10
        backgroundColor = .white
    }
}

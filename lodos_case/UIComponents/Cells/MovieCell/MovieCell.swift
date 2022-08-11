//
//  MovieCell.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import UIKit
import Kingfisher
import TinyConstraints

class MovieCell: UITableViewCell {

    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        //label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func populate(image: String?, title: String?, year: String?) {
        configureContents(image: image, title: title, year: year)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        yearLabel.text = nil
    }
}

// MARK: - UILayout
extension MovieCell {
    
    private func addSubViews() {
        addImageView()
        addTitleLabel()
        addYearLabel()
    }
    
    private func addImageView() {
        contentView.addSubview(movieImage)
        movieImage.leadingToSuperview(offset: 8)
        movieImage.topToSuperview(offset: 8)
        movieImage.bottomToSuperview()
        let width = contentView.frame.width * 0.43
        let height = (width * 10) / 8
        movieImage.width(width)
        movieImage.height(height, priority: .init(rawValue: 999))
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.top(to: movieImage)
        titleLabel.leadingToTrailing(of: movieImage, offset: 8)
        titleLabel.trailingToSuperview(offset: 8)
    }
    
    private func addYearLabel() {
        contentView.addSubview(yearLabel)
        yearLabel.leading(to: titleLabel)
        yearLabel.trailingToSuperview(offset: 8)
        yearLabel.topToBottom(of: titleLabel)
    }
}

// MARK: - ConfigureContents
extension MovieCell {
    
    private func configureContents(image: String?, title: String?, year: String?) {
        if let image = image {
            movieImage.kf.setImage(with: image.lodosURL)
        }
        
        if let title = title {
            titleLabel.text = title
        }
        
        if let year = year {
            yearLabel.text = year
        }
    }
}


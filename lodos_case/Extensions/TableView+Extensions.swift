//
//  TableView+Extensions.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func setEmptyViewIcon(message: String, image: UIImage) {
        let emptyCellView = EmptyCellView(frame: CGRect(x: self.center.x,
                                                                y: self.center.y,
                                                                width: self.bounds.size.width,
                                                                height: self.bounds.size.height))
        
        emptyCellView.setImage = image
        emptyCellView.messageText = message

        self.backgroundView = emptyCellView
    }
    
    func showActivityIndicator() {
         
        let activityIndicator = UIActivityIndicatorView(style: .gray)
         
         addSubview(activityIndicator)
         activityIndicator.centerInSuperview()
         activityIndicator.startAnimating()
         
         self.backgroundView = activityIndicator
     }

    func restore() {
        self.backgroundView = nil
    }
    
    func showSpinnerView() {
        let view = UIView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.center = view.center
        spinner.startAnimating()
        view.addSubview(spinner)
        self.tableFooterView = view
    }
    
    func hideSpinnerView() {
        self.tableFooterView = nil
    }
}

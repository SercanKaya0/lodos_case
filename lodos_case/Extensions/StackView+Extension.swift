//
//  StackView+Extension.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}

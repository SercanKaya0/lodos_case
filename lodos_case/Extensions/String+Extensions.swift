//
//  String+Extension.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation

extension String {
 
    var lodosURL: URL? {
        let stringUrl = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let stringUrl = stringUrl {
            return URL(string: stringUrl)
        } else {
            return nil
        }
    }
}

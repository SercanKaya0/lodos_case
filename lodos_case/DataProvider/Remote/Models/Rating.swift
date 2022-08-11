//
//  Rating.swift
//  lodos_case
//
//  Created by sercan kaya on 11.08.2022.
//

import Foundation

struct Rating: Decodable {
    
    let source, value: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}


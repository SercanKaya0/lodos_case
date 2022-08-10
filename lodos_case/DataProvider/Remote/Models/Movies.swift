//
//  Movies.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

struct Movie: Decodable {
    
    let search: [Search]?
      let totalResults, response: String?

      enum CodingKeys: String, CodingKey {
          case search = "Search"
          case totalResults
          case response = "Response"
      }
}

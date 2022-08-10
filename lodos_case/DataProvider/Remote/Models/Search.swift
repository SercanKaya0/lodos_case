//
//  Ratings.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

struct Search: Decodable {
    let title, year, imdbID: String?
    let type: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

//
//  HTTPClients.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

enum TheOmdbAPI : BaseClientGenerator {
    
    case getMovies(search: String, page: Int)
    case getMovieDetail(imdbId: String)
    
    var scheme: String { "https" }
    
    var host: String { "www.omdbapi.com" }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        case .getMovieDetail:
            return ""
        }
    }
    
    var queryItems: [URLQueryItem]?{
        switch self {
        case .getMovies(let search, let page):
            return [
                URLQueryItem(name: "s", value: search),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "apikey", value: "5d8b9e8c"),
            ]
        case .getMovieDetail(let imdbId):
            return [
                URLQueryItem(name: "i", value: imdbId),
                URLQueryItem(name: "apikey", value: "5d8b9e8c"),
            ]
        default :
            return nil
        }
    }
    
    //MARK: - Default GET
    var method: HttpMethod{
        switch self {
        default:
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        return [
            .contentType(),
        ]
    }
    
    //MARK: - Default Nil
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}

//
//  NetworkError.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation

enum NetworkError : Error, LocalizedError{
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}

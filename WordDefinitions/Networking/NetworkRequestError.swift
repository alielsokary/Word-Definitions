//
//  NetworkRequestError.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation
import Moya

enum NetworkRequestError: LocalizedError {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(Int)
    case serverError
    case error5xx(Int)
    case decodingError(String)
    case urlSessionFailed(URLError)
    case unknownError
    case noInternetConnection
    case moyaError(MoyaError)
    case custom(String)
    
    init(moyaError: MoyaError) {
        self = .moyaError(moyaError)
    }
    
    init(urlError: URLError) {
        switch urlError.code {
        case .notConnectedToInternet:
            self = .noInternetConnection
        default:
            self = .urlSessionFailed(urlError)
        }
    }
    
    init(decodingError: DecodingError) {
        self = .decodingError(decodingError.localizedDescription)
    }
    
    init(dictionaryError: DictionaryAPIError) {
        self = .custom(dictionaryError.message)
    }
    
    init(error: Error) {
        self = .unknownError
    }

    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "Not found"
        case .error4xx(let code):
            return "Client error with code \(code)"
        case .serverError:
            return "Server error"
        case .error5xx(let code):
            return "Server error with code \(code)"
        case .decodingError(let message):
            return "Decoding error: \(message)"
        case .urlSessionFailed(let error):
            return "\(error.localizedDescription)"
        case .unknownError:
            return "Unknown error"
        case .noInternetConnection:
            return "No internet connection"
        case .moyaError(let error):
            return "\(error.localizedDescription)"
        case .custom(let message):
            return "\(message)"
        }
    }
}

//
//  EntryService.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation
import Combine
import Moya
import CombineMoya

protocol EntryService {
    func fetchEntry(word: String) -> AnyPublisher<Entry, NetworkRequestError>
}

class EntryServiceImpl: EntryService {
    private let provider: MoyaProvider<DictionaryAPI>!

    init(provider: MoyaProvider<DictionaryAPI> = MoyaProvider<DictionaryAPI>()) {
        self.provider = provider
    }

    func fetchEntry(word: String) -> AnyPublisher<Entry, NetworkRequestError> {
        return provider.requestPublisher(.getEntry(word: word))
            .tryMap { response in
                if (200...299).contains(response.statusCode) {
                    return try JSONDecoder().decode(Entry.self, from: response.data)
                } else {
                    throw try JSONDecoder().decode(DictionaryAPIError.self, from: response.data)
                }
            }
            .mapError { error in
                switch error {
                case let moyaError as MoyaError:
                    return NetworkRequestError(moyaError: moyaError)
                case let urlError as URLError:
                    return NetworkRequestError(urlError: urlError)
                case let decodingError as DecodingError:
                    return NetworkRequestError(decodingError: decodingError)
                case let apiError as DictionaryAPIError:
                    return NetworkRequestError(dictionaryError: apiError)
                default:
                    return NetworkRequestError(error: error)
                }
            }
            .eraseToAnyPublisher()
    }
}

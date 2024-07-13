//
//  EntryService.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation
import Combine

protocol EntryService {
    func dispatch<R: EndpointRouter>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError>
}

struct EntryServiceImpl: EntryService {

    private let apiClient: APIClient = APIClient()

    @discardableResult
    public func dispatch<R: EndpointRouter>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: APIConstants.basedURL) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = apiClient.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}

//
//  MockEntryService.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import Combine
@testable import WordDefinitions

class MockEntryService: EntryService {
    func fetchEntry(word: String) -> AnyPublisher<Entry, NetworkRequestError> {
        let entryElement = makeElement()
        let entry = [entryElement]
        return Just(entry)
            .setFailureType(to: NetworkRequestError.self)
            .eraseToAnyPublisher()
    }
}

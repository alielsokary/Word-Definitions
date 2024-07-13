//
//  MockEntriesRepository.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import Combine
@testable import WordDefinitions

class MockEntriesRepository: EntriesRepository {
    func search(word: String) -> AnyPublisher<[EntryViewModel], NetworkRequestError> {

        let entry = EntryViewModel(entry: makeElement())
        return Just([entry])
            .setFailureType(to: NetworkRequestError.self)
            .eraseToAnyPublisher()
    }

    func fetchSavedEntries() -> [EntryViewModel] {
        return []
    }

    private func makeElement() -> EntryElement {
        let element = EntryElement(word: "test",
                                        phonetic: "wo",
                                        phonetics: nil,
                                        meanings: nil,
                                        license: nil,
                                        sourceUrls: nil)
        return element
    }
}

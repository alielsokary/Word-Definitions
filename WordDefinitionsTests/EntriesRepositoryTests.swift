//
//  EntriesRepositoryTests.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import XCTest
import Combine
@testable import WordDefinitions

class EntriesRepositoryTests: XCTestCase {

    var repository: EntriesRepositoryImpl!
    var apiService: MockEntryService!
    var storageService: MockEntriesStorageService!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        apiService = MockEntryService()
        storageService = MockEntriesStorageService()
        repository = EntriesRepositoryImpl(apiService: apiService, storageService: storageService)
        cancellables = []
    }

    override func tearDown() {
        apiService = nil
        storageService = nil
        repository = nil
        cancellables = nil
        super.tearDown()
    }

    func test_search_resturnsCorrectWord() {
        let expectation = self.expectation(description: "Searching for a word")

        repository.search(word: "test")
            .sink { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got error: \(error)")
                }
            } receiveValue: { entries in
                XCTAssertEqual(entries.count, 1)
                XCTAssertEqual(entries.first?.word, "test")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchSavedEntries_returnsCorrectEntry() {
        let entry = makeElement()
        let entryViewModel = EntryViewModel(entry: entry)
        storageService.save(entry: entryViewModel)

        let fetchedEntries = repository.fetchSavedEntries()
        XCTAssertEqual(fetchedEntries.count, 1)
        XCTAssertEqual(fetchedEntries.first?.word, "test")
    }
}

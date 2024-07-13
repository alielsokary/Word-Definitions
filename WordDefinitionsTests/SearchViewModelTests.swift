//
//  SearchViewModelTests.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import XCTest
import Combine
@testable import WordDefinitions

class SearchViewModelTests: XCTestCase {

    var viewModel: SearchViewModel!
    var repository: MockEntriesRepository!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        repository = MockEntriesRepository()
        viewModel = SearchViewModel(repository: repository)
        cancellables = []
    }

    override func tearDown() {
        repository = nil
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func test_filteredEntries_containsCorrectWord() {
        let expectation = self.expectation(description: "Searching for a word")
        viewModel.searchText = "test"

        viewModel.$filteredEntries
            .dropFirst()
            .sink { entries in
                XCTAssertEqual(entries.count, 1)
                XCTAssertEqual(entries.first?.word, "test")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.search(word: "test")
        wait(for: [expectation], timeout: 1.0)
    }
}

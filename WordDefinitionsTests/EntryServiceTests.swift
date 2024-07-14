//
//  EntryServiceTests.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import XCTest
import Combine
import Moya
@testable import WordDefinitions

class EntryServiceTests: XCTestCase {

    var service: EntryServiceImpl!
    var provider: MoyaProvider<DictionaryAPI>!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        provider = MoyaProvider<DictionaryAPI>(stubClosure: MoyaProvider.immediatelyStub)
        service = EntryServiceImpl(provider: provider)
        cancellables = []
    }

    override func tearDown() {
        provider = nil
        service = nil
        cancellables = nil
        super.tearDown()
    }

    func test_fetchEntry_returnsCorrectData() {
        let expectation = self.expectation(description: "Fetching entry for a word")

        service.fetchEntry(word: "test")
            .sink { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got error: \(error)")
                }
            } receiveValue: { entry in
                XCTAssertEqual(entry.count, 1)
                XCTAssertEqual(entry.first?.word, "test")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

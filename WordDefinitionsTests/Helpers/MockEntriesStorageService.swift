//
//  MockEntriesStorageService.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

@testable import WordDefinitions

class MockEntriesStorageService: EntriesStorageService {
    var savedEntries = [EntryViewModel]()

    func save(entry: EntryViewModel) {
        savedEntries.append(entry)
    }

    func fetchEntries() -> [EntryViewModel] {
        return savedEntries
    }
}

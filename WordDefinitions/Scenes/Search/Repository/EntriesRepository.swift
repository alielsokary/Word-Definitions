//
//  EntriesRepository.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Combine

protocol EntriesRepository {
    func search(word: String) -> AnyPublisher<[EntryViewModel], NetworkRequestError>
    func fetchSavedEntries() -> [EntryViewModel]
}

class EntriesRepositoryImpl: EntriesRepository {
    private let apiService: EntryService
    private let storageService: EntriesStorageService
    
    init(apiService: EntryService, storageService: EntriesStorageService) {
        self.apiService = apiService
        self.storageService = storageService
    }
    
    func search(word: String) -> AnyPublisher<[EntryViewModel], NetworkRequestError> {
        return apiService.dispatch(APIRouter.GetEntry(word: word))
            .map { entries in
                guard let firstEntry = entries.first else { return [] }
                let entryViewModel = EntryViewModel(entry: firstEntry)
                self.storageService.save(entry: entryViewModel)
                return [entryViewModel]
            }
            .eraseToAnyPublisher()
    }

    func fetchSavedEntries() -> [EntryViewModel] {
        return storageService.fetchEntries()
    }
}

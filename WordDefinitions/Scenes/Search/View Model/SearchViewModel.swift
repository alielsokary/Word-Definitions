//
//  SearchViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var entriesList = [EntryViewModel]()
    @Published var errorWrapper: ErrorWrapper?
    
    private let repository: EntriesRepository
    private var cancelable: Set<AnyCancellable> = []
    
    init(repository: EntriesRepository) {
        self.repository = repository
        
        self.entriesList = repository.fetchSavedEntries()
        
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newValue in
                self?.search(word: newValue)
            }
            .store(in: &cancelable)
    }
    
    func search(word: String) {
        guard !word.isEmpty else { return }
        
        if entriesList.contains(where: { $0.word.lowercased() == word.lowercased() }) {
            return
        }
        
        repository.search(word: word)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    self.errorWrapper = ErrorWrapper(message: error.localizedDescription)
                }
            } receiveValue: { [weak self] newEntries in
                guard let self = self else { return }
                
                self.entriesList.append(contentsOf: newEntries)
            }
            .store(in: &cancelable)
    }
}


struct ErrorWrapper: Identifiable {
    let id = UUID()
    let message: String
}

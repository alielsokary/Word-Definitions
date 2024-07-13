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
    
    private let apiService: EntryService
    private var cancelable: Set<AnyCancellable> = []
    
    @Published var entriesList = [EntryViewModel]()
    
    init(apiService: EntryService) {
        self.apiService = apiService
        
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
        
        apiService.dispatch(
            APIRouter.GetEntry(word: word))
        .sink { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                print(error)
            }
        } receiveValue: { [weak self] entries in
            guard let self = self else { return }
            
            if let newEntry = entries.map({ EntryViewModel(entry: $0) }).first {
                entriesList.append(newEntry)
            }
        }.store(in: &cancelable)
    }
}

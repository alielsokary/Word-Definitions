//
//  DefinitionDetailsViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

class DefinitionDetailsViewModel: ObservableObject {
    @Published var word: String
    @Published var phonetic: String
    @Published var meanings: [MeaningViewModel]

    init(entry: EntryViewModel) {
        self.word = entry.word
        self.phonetic = entry.phonetic
        self.meanings = entry.meanings.map { MeaningViewModel(meaning: $0) }
    }
}


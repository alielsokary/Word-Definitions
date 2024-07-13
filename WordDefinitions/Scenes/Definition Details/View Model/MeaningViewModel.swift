//
//  MeaningViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

class MeaningViewModel: Identifiable, ObservableObject {
    @Published var partOfSpeech: String
    @Published var definitions: [DefinitionViewModel]

    init(meaning: Meaning) {
        self.partOfSpeech = meaning.partOfSpeech
        self.definitions = meaning.definitions.map { DefinitionViewModel(definition: $0) }
    }
}

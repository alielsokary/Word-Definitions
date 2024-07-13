//
//  DefinitionViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

class DefinitionViewModel: Identifiable, ObservableObject {
    @Published var definition: String
    @Published var example: String?

    init(definition: Definition) {
        self.definition = definition.definition
        self.example = definition.example
    }
}

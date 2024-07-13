//
//  EntryViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

struct EntryViewModel: Identifiable {
    var id: String { word }
    let word: String
    let phonetic: String
    
    init(entry: EntryElement) {
        self.word = entry.word ?? ""
        self.phonetic = entry.phonetic ?? ""
    }
}

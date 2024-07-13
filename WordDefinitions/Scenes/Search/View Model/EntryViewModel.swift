//
//  EntryViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

class EntryViewModel: Identifiable {
    var id: String { word }
    let word: String
    let phonetic: String
    
    init(entry: EntryElement) {
        self.word = entry.word ?? ""
        self.phonetic = entry.phonetic ?? ""
    }
    
    init(entryObject: EntryObject) {
        self.word = entryObject.word
        self.phonetic = entryObject.phonetic
    }
}

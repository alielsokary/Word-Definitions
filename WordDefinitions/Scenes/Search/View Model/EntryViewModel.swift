//
//  EntryViewModel.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

struct EntryViewModel: Identifiable, Equatable {
    var id: String { word }
    let word: String
    let phonetic: String
    let meanings: [Meaning]

    init(entry: EntryElement) {
        self.word = entry.word ?? ""
        self.phonetic = entry.phonetic ?? ""
        self.meanings = entry.meanings ?? []
    }
    
    init(entryObject: EntryObject) {
        self.word = entryObject.word
        self.phonetic = entryObject.phonetic
        self.meanings = entryObject.meanings.map { Meaning(from: $0) }
    }

    static func ==(lhs: EntryViewModel, rhs: EntryViewModel) -> Bool {
        return lhs.word.lowercased() == rhs.word.lowercased() && lhs.phonetic == rhs.phonetic
    }
}



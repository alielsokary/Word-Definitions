//
//  Entry.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

// MARK: - Entry
typealias Entry = [EntryElement]

// MARK: - EntryElement
struct EntryElement: Codable {
    let word, phonetic: String?
    let phonetics: [Phonetic]?
    let meanings: [Meaning]?
    let license: License?
    let sourceUrls: [String]?
}

// MARK: - License
struct License: Codable {
    let name: String?
    let url: String?
}

// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]

    init(from meaningObject: MeaningObject) {
        self.partOfSpeech = meaningObject.partOfSpeech
        self.definitions = meaningObject.definitions.map { Definition(from: $0) }
    }
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String
    let example: String?

    init(from definitionObject: DefinitionObject) {
        self.definition = definitionObject.definition
        self.example = definitionObject.example
    }
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let text: String?
    let audio: String?
    let sourceURL: String?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case text, audio
        case sourceURL = "sourceUrl"
        case license
    }
}

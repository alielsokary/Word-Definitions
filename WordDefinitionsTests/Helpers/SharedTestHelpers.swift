//
//  SharedTestHelpers.swift
//  WordDefinitionsTests
//
//  Created by Ali Elsokary on 14/07/2024.
//

import Foundation
@testable import WordDefinitions

func makeElement() -> EntryElement {
    let element = EntryElement(word: "test",
                               phonetic: "wo",
                               phonetics: nil,
                               meanings: nil,
                               license: nil,
                               sourceUrls: nil)
    return element
}

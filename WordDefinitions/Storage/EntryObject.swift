//
//  EntryObject.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import RealmSwift

public class EntryObject: Object {
    @Persisted public var word: String = ""
    @Persisted public var phonetic: String = ""
}

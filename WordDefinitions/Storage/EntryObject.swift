//
//  EntryObject.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import RealmSwift

public class EntryObject: Object {
    @Persisted(primaryKey: true) public var word: String = ""
    @Persisted public var phonetic: String = ""
    @Persisted var meanings = List<MeaningObject>()
}

public class MeaningObject: Object {
    @Persisted public var partOfSpeech: String = ""
    @Persisted var definitions = List<DefinitionObject>()
}

public class DefinitionObject: Object {
    @Persisted public var definition: String = ""
    @Persisted public var example: String? = nil
}

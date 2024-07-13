//
//  EntriesStorageService.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import RealmSwift

protocol EntriesStorageService {
    func save(entry: EntryViewModel)
    func fetchEntries() -> [EntryViewModel]
}

class EntriesStorageServiceImpl: EntriesStorageService {
    private let realm: Realm

    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }

    func save(entry: EntryViewModel) {
        let entryObject = EntryObject()
        entryObject.word = entry.word
        entryObject.phonetic = entry.phonetic

        entry.meanings.forEach { meaning in
            let meaningObject = MeaningObject()
            meaningObject.partOfSpeech = meaning.partOfSpeech
            meaning.definitions.forEach { definition in
                let definitionObject = DefinitionObject()
                definitionObject.definition = definition.definition
                definitionObject.example = definition.example
                meaningObject.definitions.append(definitionObject)
            }
            entryObject.meanings.append(meaningObject)
        }

        do {
            try realm.write {
                realm.add(entryObject, update: .modified)
            }
        } catch {
            print("Failed to save entry to Realm: \(error.localizedDescription)")
        }
    }

    func fetchEntries() -> [EntryViewModel] {
        let entryObjects = realm.objects(EntryObject.self)
        return entryObjects.map { EntryViewModel(entryObject: $0) }
    }
}

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

    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }

    func save(entry: EntryViewModel) {
        let entryObject = EntryObject()
        entryObject.word = entry.word
        entryObject.phonetic = entry.phonetic

        try! realm.write {
            realm.add(entryObject)
        }
    }

    func fetchEntries() -> [EntryViewModel] {
        let entryObjects = realm.objects(EntryObject.self)
        return entryObjects.map { EntryViewModel(entryObject: $0) }
    }
}

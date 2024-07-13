//
//  DictionaryAPIError.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 14/07/2024.
//

import Foundation

struct DictionaryAPIError: Decodable, Error {
    let title: String
    let message: String
    let resolution: String
}

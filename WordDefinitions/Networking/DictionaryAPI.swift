//
//  DictionaryAPI.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation
import Moya

enum DictionaryAPI {
    case getEntry(word: String)
}

extension DictionaryAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.dictionaryapi.dev/api/v2")!
    }

    var path: String {
        switch self {
        case .getEntry(let word):
            return "/entries/en/\(word)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getEntry:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getEntry:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}

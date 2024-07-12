//
//  APIRouter.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

struct APIRouter {

    struct GetEntry: EndpointRouter {
        typealias ReturnType = Entry
        
        let word: String
        var path: String {
            "/entries/en/\(word)"
        }
        var method: HTTPMethod = .get
    }
}

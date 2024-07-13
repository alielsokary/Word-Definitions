//
//  Optional+Extension.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import Foundation

protocol Defaultable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Defaultable {
    var unwrapped: Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.defaultValue
        }
    }
}

extension Int: Defaultable {
    static var defaultValue: Int { return 0 }
}

extension CGFloat: Defaultable {
    static var defaultValue: CGFloat { return 0 }
}

extension String: Defaultable {
    static var defaultValue: String { return "" }
}

extension Bool: Defaultable {
    static var defaultValue: Bool { return false }
}

extension Array: Defaultable {
    static var defaultValue: [Element] { return [] }
}

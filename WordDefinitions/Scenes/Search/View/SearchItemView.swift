//
//  SearchItemView.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import SwiftUI

struct SearchItemView: View {

    var entry: EntryViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(entry.word)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(entry.phonetic)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }.contentShape(Rectangle())
    }
}

//
//  DefinitionView.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import SwiftUI

struct DefinitionView: View {
    @ObservedObject var viewModel: DefinitionViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.definition)
                .font(.body)

            if let example = viewModel.example, !example.isEmpty {
                Text("Example: \(example)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

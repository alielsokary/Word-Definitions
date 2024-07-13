//
//  MeaningView.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import SwiftUI

struct MeaningView: View {
    @ObservedObject var viewModel: MeaningViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.partOfSpeech)
                .font(.headline)
                .foregroundColor(.gray)

            ForEach(viewModel.definitions) { definitionViewModel in
                DefinitionView(viewModel: definitionViewModel)
            }
        }
        .padding(.vertical, 8)
    }
}

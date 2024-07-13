//
//  DefinitionDetailsView.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import SwiftUI

struct DefinitionDetailsView: View {
    @ObservedObject private var viewModel: DefinitionDetailsViewModel

    init(viewModel: DefinitionDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(viewModel.word)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(viewModel.phonetic)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }

                ForEach(viewModel.meanings) { meaningViewModel in
                    MeaningView(viewModel: meaningViewModel)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.word)
        .navigationBarTitleDisplayMode(.inline)
    }
}

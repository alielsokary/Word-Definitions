//
//  SearchView.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel: SearchViewModel
    private let coordinator: MainCoordinator?

    init(viewModel: SearchViewModel, coordinator: MainCoordinator?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack {
            List(viewModel.entriesList) { message in
                VStack(alignment: .leading) {
                    Text(message.word)
                        .font(.headline)
                    Text(message.phonetic)
                }
            }
            .navigationTitle("Search Definition")
        }
        .searchable(text: $viewModel.searchText)
    }
}

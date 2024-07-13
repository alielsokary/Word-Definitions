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
            List(viewModel.filteredEntries) { entry in
                ZStack(alignment: .leading) {
                    SearchItemView(entry: entry)
                        .contentShape(Rectangle())

                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if let selectedIndex = viewModel.entriesList.firstIndex(of: entry) {
                                coordinator?.navigateToDeinitionDetails(with: viewModel.currentEntry(at: selectedIndex))
                            }
                        }
                }
            }
            .navigationTitle(viewModel.title)
        }
        .searchable(text: $viewModel.searchText)
        .alert(item: $viewModel.errorWrapper) { errorWrapper in
            Alert(title: Text(viewModel.errorTitle), message: Text(errorWrapper.message), dismissButton: .default(Text(viewModel.okTitle)))
        }
    }
}

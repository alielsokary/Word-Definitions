//
//  DefinitionDetailsCoordinator.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import UIKit
import SwiftUI

class DefinitionDetailsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var viewModel: EntryViewModel!

    init(navigationController: UINavigationController, viewModel: EntryViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }

    func start() {
        let definitionDetailsViewModel = DefinitionDetailsViewModel(entry: viewModel)
        let newView = UIHostingController(rootView: DefinitionDetailsView(viewModel: definitionDetailsViewModel))
        navigationController.pushViewController(newView, animated: true)
    }
}

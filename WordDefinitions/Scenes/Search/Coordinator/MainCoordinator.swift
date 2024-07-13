//
//  MainCoordinator.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import UIKit
import SwiftUI

class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let apiService: EntryService = EntryServiceImpl()
        let storageService: EntriesStorageService = EntriesStorageServiceImpl()
        let repository: EntriesRepository = EntriesRepositoryImpl(apiService: apiService, storageService: storageService)
        let viewModel = SearchViewModel(repository: repository)

        let vc = UIHostingController(rootView: SearchView(viewModel: viewModel, coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    }
}

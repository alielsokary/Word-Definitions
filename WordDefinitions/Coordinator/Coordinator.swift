//
//  Coordinator.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 13/07/2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

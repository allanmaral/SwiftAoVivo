//
//  ProfileCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ProfileViewController()
        viewController.didTapNext = { _, _, _, _ in
            self.navigateToAddress()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToAddress() {
        let coordinator = AddressCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
}

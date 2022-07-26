//
//  RegisterCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class RegisterCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        viewController.didTapLogin = {
            self.navigateToLoginView()
        }
        viewController.didTapRegister = { _, _ in
            self.navigateToProfileView()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToLoginView() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigateToProfileView() {
        let coordinator = ProfileCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
}

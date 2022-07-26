//
//  LoginCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.didTapRegister = {
            self.navigateToRegisterView()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToRegisterView() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
}

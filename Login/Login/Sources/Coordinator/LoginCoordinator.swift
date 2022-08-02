//
//  LoginCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    private var flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.didTapRegister = {
            self.navigateToRegisterView()
        }
        viewController.didTapLogin = { email, password in
            self.flowViewModel.userProfileViewModel.email = email
        }
        self.flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToRegisterView() {
        let coordinator = RegisterCoordinator(flowViewModel: flowViewModel)
        coordinator.start()
    }
    
}

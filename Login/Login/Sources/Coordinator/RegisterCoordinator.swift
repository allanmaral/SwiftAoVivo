//
//  RegisterCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class RegisterCoordinator: Coordinator {
    let flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = RegisterViewController()
        viewController.didTapLogin = {
            self.navigateToLoginView()
        }
        viewController.didTapRegister = { email, _ in
            self.flowViewModel.userProfileViewModel.email = email
            self.navigateToProfileView()
        }
        flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToLoginView() {
        flowViewModel.navigationController.popViewController(animated: true)
    }
    
    func navigateToProfileView() {
        let coordinator = ProfileCoordinator(flowViewModel: flowViewModel)
        coordinator.start()
    }
    
}

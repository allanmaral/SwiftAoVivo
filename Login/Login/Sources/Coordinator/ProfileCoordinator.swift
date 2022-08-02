//
//  ProfileCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    let flowViewModel: FlowViewModel

    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = ProfileViewController()
        viewController.didTapNext = { _, _, _, _ in
            self.navigateToAddress()
        }
        flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToAddress() {
        let coordinator = AddressCoordinator(flowViewModel: flowViewModel)
        coordinator.start()
    }
    
}

//
//  HomeCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 08/08/22.
//

import Foundation

class HomeCoordinator: Coordinator {
    let flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = HomeViewController()
        
        viewController.setUserData(userProfileViewModel: flowViewModel.userProfileViewModel)
        flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
}

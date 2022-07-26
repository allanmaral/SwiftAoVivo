//
//  AddressCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddressViewController()
        
        self.navigationController.setViewControllers([viewController], animated: true)
    }
    
}

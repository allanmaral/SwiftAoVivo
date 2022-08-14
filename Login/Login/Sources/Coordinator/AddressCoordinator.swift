//
//  AddressCoordinator.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressCoordinator: Coordinator {
    let flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = AddressViewController()
        viewController.didSearchCep = { cep in
            CepViewModel.get(cep: cep) { (viewModel, error) in
                guard let viewModel = viewModel else { return }
                
                if viewModel.isCepValid {
                    viewController.setAddressFromSearch(viewModel)
                } else {
                    viewController.showInvalidCepMessage()
                }
            }
        }
        
        viewController.didSave = { street, number, city, state in
            self.flowViewModel.userProfileViewModel.street = street
            self.flowViewModel.userProfileViewModel.number = number
            self.flowViewModel.userProfileViewModel.city = city
            self.flowViewModel.userProfileViewModel.state = state
            
            self.navigateToHomeView()
        }
        
        self.flowViewModel.navigationController.setViewControllers([viewController], animated: true)
    }
    
    func navigateToHomeView() {
        let coordinator = LoginCoordinator(flowViewModel: flowViewModel)
        coordinator.start()
    }
    
}

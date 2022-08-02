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
        
        self.flowViewModel.navigationController.setViewControllers([viewController], animated: true)
    }
    
}

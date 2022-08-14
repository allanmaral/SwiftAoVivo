//
//  AddressViewController.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressViewController: LGViewController {
    
    // MARK: - Clousures
    var didSearchCep: ((_ cep: String) -> Void)?
    var didSave: ((_ street: String, _ number: String, _ city: String, _ state: String) -> Void)?
    
    // MARK: - Properties
    lazy var addressView: AddressView = {
        let view = AddressView()
        view.didSearchCep = { [weak self] cep in
            self?.didSearchCep?(cep)
        }
        view.didSave = { [weak self] street, number, city, state in
            self?.didSave?(street, number, city, state)
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = addressView
        self.title = LocalizableStrings.address.localize()
    }
    
    func setAddressFromSearch(_ cepViewModel: CepViewModel) {
        DispatchQueue.main.async {
            self.addressView.setAddressFromSearch(cepViewModel)
        }
    }
    
    func showInvalidCepMessage() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Erro", message: "CEP não encontrado", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true)
            
            self.addressView.loadingIndicator.isHidden = true
            self.addressView.loadingIndicator.stopAnimating()
        }
    }

}

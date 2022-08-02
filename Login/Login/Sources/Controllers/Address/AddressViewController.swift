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
    
    // MARK: - Properties
    lazy var addressView: AddressView = {
        let view = AddressView()
        view.didSearchCep = { [weak self] cep in
            self?.didSearchCep?(cep)
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
        addressView.setAddressFromSearch(cepViewModel)
    }
    
    func showInvalidCepMessage() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Erro", message: "CEP não encontrado", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true)
        }
    }

}

//
//  AddressViewController.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressViewController: LGViewController {

    lazy var addressView: AddressView = {
        let view = AddressView()
        
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

}

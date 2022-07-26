//
//  ProfileViewController.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class ProfileViewController: LGViewController {
    
    // MARK: - Clousures
    var didTapNext: ((_ age: String, _ gender: String, _ cpf: String, _ phone: String) -> Void)?
    
    // MARK: - View
    lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.didTapNext = { [weak self] age, gender, cpf, phone in
            self?.didTapNext?(age, gender, cpf, phone)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = profileView
        self.title = LocalizableStrings.profile.localize()
    }

}

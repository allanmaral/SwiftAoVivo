//
//  RegisterViewController.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class RegisterViewController: LGViewController {
    
    // MARK: - Clousures
    var didTapLogin: (() -> Void)?
    var didTapRegister: ((_ email: String, _ password: String) -> Void)?
    
    // MARK: - View
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        view.didTapLogin = { [weak self] in
            self?.didTapLogin?()
        }
        view.didTapRegister = { [weak self] email, password in
            self?.didTapRegister?(email, password)
        }
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = registerView
        self.title = LocalizableStrings.register.localize()
    }
}
